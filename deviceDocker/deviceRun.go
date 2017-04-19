package main

import (
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
	"strings"
	"time"
)

const (
	upload_path string = "./"
)

func helloHandle(w http.ResponseWriter, r *http.Request) {
	var str string
	setDevice := strings.Split(r.RequestURI, "=")
	if setDevice[1] == "1" {
		ExeCli("1")
		deviceState = 1
	} else {
		ExeCli("0")
		deviceState = 0
	}
	if deviceState == 1 {
		str = "<html><head><title>设备信息   开关状态 </title></head><body>设备信息   开关状态 开 <a href=\"/hello?device=1\">开</a> <a href=\"/hello?device=0\">关</a> </body></html>"
	} else if deviceState == 0 {

		str = "<html><head><title>设备信息   开关状态 </title></head><body>设备信息   开关状态 关 <a href=\"/hello?device=1\">开</a> <a href=\"/hello?device=0\">关</a> </body></html>"
	}
	io.WriteString(w, str)
}

//上传
func uploadHandle(w http.ResponseWriter, r *http.Request) {
	//从请求当中判断方法
	if r.Method == "GET" {
		io.WriteString(w, "<html><head><title>我的第一个页面</title></head><body><form action='' method=\"post\" enctype=\"multipart/form-data\"><label>上传图片</label><input type=\"file\" name='file'  /><br/><label><input type=\"submit\" value=\"上传图片\"/></label></form></body></html>")
	} else {
		//获取文件内容 要这样获取
		file, head, err := r.FormFile("file")
		if err != nil {
			fmt.Println(err)
			return
		}
		defer file.Close()
		//创建文件
		fW, err := os.Create(upload_path + head.Filename)
		if err != nil {
			fmt.Println("文件创建失败")
			return
		}
		defer fW.Close()
		_, err = io.Copy(fW, file)
		if err != nil {
			fmt.Println("文件保存失败")
			return
		}
		fmt.Println("post file ok")
		//io.WriteString(w, head.Filename+" 保存成功")
		http.Redirect(w, r, "/hello", http.StatusFound)
		//io.WriteString(w, head.Filename)
	}
}

// 静态文件处理
func StaticServer(w http.ResponseWriter, req *http.Request) {
	fmt.Println("path:" + req.URL.Path)
	//	w.Header().Set("Content-type", "text/html")
	staticHandler.ServeHTTP(w, req)
	fmt.Println("get file ok")

}

var staticHandler http.Handler

func demo(input chan string) {
	t1 := time.NewTimer(time.Second * 5)
	//    t2 := time.NewTimer(time.Second * 10)
	for {
		select {
		case <-input:
			println("timer")
		case <-t1.C:
			t1.Reset(time.Second * 5)

		}
		fmt.Println("dingshi report fuwuqi")
	}
}

//  输入 "on" 或者  "off"
func ExeCli(str string) {
	e1 := exec.Command("/bin/sh", "-c", "mosquitto_pub -h 172.17.42.1 -t sensor  -m "+str)
	b1, _ := e1.Output()
	e1.Run()

	fmt.Println(b1)

}

func deviceInfoHandle(w http.ResponseWriter, r *http.Request) {
	//从请求当中判断方法
	var str string
	if r.Method == "GET" {

		if deviceState == 1 {
			str = "<html><head><title>设备信息   开关状态 </title></head><body>设备信息   开关状态 开 <a href=\"/hello?device=1\">开</a> <a href=\"/hello?device=0\">关</a> </body></html>"
		} else if deviceState == 0 {

			str = "<html><head><title>设备信息   开关状态 </title></head><body>设备信息   开关状态 关 <a href=\"/hello?device=1\">开</a> <a href=\"/hello?device=0\">关</a> </body></html>"
		}
		io.WriteString(w, str)
	}
}

var deviceState int

func main() {
	//启动一个http 服务器

	deviceState = 1

	ii := make(chan string)

	go demo(ii)

	staticHandler = http.FileServer(http.Dir("./"))

	http.HandleFunc("/hello", helloHandle)

	//上传
	http.HandleFunc("/image", uploadHandle)

	http.HandleFunc("/device", deviceInfoHandle)

	http.HandleFunc("/", deviceInfoHandle)

	err := http.ListenAndServe(":5555", nil)
	if err != nil {
		fmt.Println("服务器启动失败")
		return
	}
	fmt.Println("服务器启动成功")
}
