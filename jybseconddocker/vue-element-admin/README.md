#解决Error: ENOENT: no such file or directory, scandir 'D:\IdeaWork\code-front-jet\node_modules\.npminstall\node-sass\3.7.0\node-sass\vendor'
在使用npm安装node-sass的时候，可能会出现如下的报错：
Error: ENOENT: no such file or directory, scandir 'D:\IdeaWork\code-front-jet\node_modules\.npminstall\node-sass\3.7.0\node-sass\vendor'

    at Error (native)
    at Object.fs.readdirSync (fs.js:856:18)
    at Object.getInstalledBinaries (D:\IdeaWork\code-front-jet\node_modules\.npminstall\node-sass\3.7.0\node-sass\lib\extensions.js:74:13)
    at foundBinariesList (D:\IdeaWork\code-front-jet\node_modules\.npminstall\node-sass\3.7.0\node-sass\lib\errors.js:20:15)
    at foundBinaries (D:\IdeaWork\code-front-jet\node_modules\.npminstall\node-sass\3.7.0\node-sass\lib\errors.js:15:5)
    at Object.module.exports.missingBinary (D:\IdeaWork\code-front-jet\node_modules\.npminstall\node-sass\3.7.0\node-sass\lib\errors.js:45:5)
    at Object.<anonymous> (D:\IdeaWork\code-front-jet\node_modules\.npminstall\node-sass\3.7.0\node-sass\lib\index.js:14:28)
    at Module._compile (module.js:413:34)
    at Object.Module._extensions..js (module.js:422:10)
    at Module.load (module.js:357:32)
    at Function.Module._load (module.js:314:12)
    at Module.require (module.js:367:17)
    at require (internal/module.js:16:19)
    at Object.<anonymous> (D:\IdeaWork\code-front-jet\node_modules\.npminstall\gulp-sass\2.2.0\gulp-sass\index.js:186:21)
    at Module._compile (module.js:413:34)
    at Object.Module._extensions..js (module.js:422:10)
解决方案是执行以下方法：
npm rebuild node-sass
问题原因：别问我，我也不知道，貌似是我在github上不知道哪个角落找到的答案， 这个问题很坑。

如果你尝试了上面的方法还是没有解决，欢迎在下面留下你的问题，一起讨论 



#解决vue-cli 解决Invalid Host header
在webpack.dev.conf.js中添加：disableHostCheck: true
 
devServer: {
 public: 'local.kingsum.biz',
 clientLogLevel: 'warning',
 historyApiFallback: true,
hot: true,
compress: true,
host: HOST || config.dev.host,
port: PORT || config.dev.port,
 
open: config.dev.autoOpenBrowser,
overlay: config.dev.errorOverlay
? { warnings: false, errors: true }
: false,
publicPath: config.dev.assetsPublicPath,
proxy: config.dev.proxyTable,
quiet: true, // necessary for FriendlyErrorsPlugin

watchOptions: {
poll: config.dev.poll,
},
disableHostCheck: true     加上这段
}

  # 克隆项目
    git clone https://github.com/PanJiaChen/vue-element-admin.git

    # 安装依赖
    npm install
    //or # 建议不要用cnpm  安装有各种诡异的bug 可以通过如下操作解决npm速度慢的问题
    npm install --registry=https://registry.npm.taobao.org

    # 本地开发 开启服务
    npm run dev
浏览器访问 http://localhost:9527

发布

    # 发布测试环境 带webpack ananalyzer
    npm run build:sit-preview

    # 构建生成环境
    npm run build:prod




# docker-node
Docker实战--部署简单nodejs应用  

# 请结合网站看
http://www.cnblogs.com/weiqinl/p/docker_node.html  

如何在Docker的container里运行Node.js程序  
主体思路：一个简单的Node.js web app,来构建一个镜像，然后基于这个镜像，运行一个容器，从而实现快速部署。  
操作环境：  
虚拟机：ubuntu 16.04 LTE 64位  

第一 先拉取基础镜像  
  sudo docker pull node:latest  
node镜像，star数很高，我们使用它作为基础镜像.latest为tag标签，标识是哪个版本。这一步，也可以省略，后面的Dockerfile文件，会自动拉取该镜像。  

第二 创建Node.js程序  
创建 package.json，并写入相关信息和依赖  

  $ mkdir -p node/website && cd node/website
  $ touch package.json
  $ vi package.json

  {
    "name": "website",
    "version": "0.0.1",
    "description": "Node.js on Docker",
    "author": "weiqinl",
    "main": "server.js",
    "scripts": {
      "start": "node server.js"
    },
    "dependencies": {
      "express": "^4.13.3"
    }
  }
创建server.js  

写一个最简单的web，监听8888端口，返回Hello world。  
使用了node官方建议的框架express  

  $ touch server.js  
  $ vi server.js

    'use strict';

    var express = require('express');

    var PORT = 8888;

    var app = express();
    app.get('/', function (req, res) {
      res.send('Hello world\n');
    });

    app.listen(PORT);
    console.log('Running on http://localhost:' + PORT);
    
第三 创建Dockerfile
Docker会依照Dockerfile的内容来构建一个镜像。

  $ cd ..
  $ touch Dockerfile
  $ vi Dockerfile

  #设置基础镜像,如果本地没有该镜像，会从Docker.io服务器pull镜像
  FROM node

  #创建app目录,保存我们的代码
  RUN mkdir -p /usr/src/node
  #设置工作目录
  WORKDIR /usr/src/node

  #复制所有文件到 工作目录。
  COPY . /usr/src/node

  #编译运行node项目，使用npm安装程序的所有依赖,利用taobao的npm安装

  WORKDIR /usr/src/node/website
  RUN npm install --registry=https://registry.npm.taobao.org

  #暴露container的端口
  EXPOSE 8888

  #运行命令
  CMD ["npm", "start"]
  
第四 构建Image  
在Dockerfile文件所在目录下，运行下面命令来构建一个Image  

  sudo docker build -t weiqinl/node .  
构建完后查看一下刚构建的镜像：  

  sudo docker images  
  
第五 运行镜像  
  sudo docker run -d --name nodewebsite -p 8888:8888 weiqinl/node:latest
-d 表示容器在后台运行  
--name 表示给容器别名 nodewebsite  
-p 表示端口映射。把本机的8888端口映射到容器的8888端口，这样外网就能通过本机的8888端口，访问我们的web了。  
后面的 weiqinl/node 是image的REPOSITORY, latest的镜像的TAG  

第六 测试  
我们先通过curl看是否能访问web  

  curl -i localhost:8888   
通过ubuntu自带的浏览器查看  

如果想进入容器，可以执行命令：  

  sudo docker exec -it weiqinl/node:latest /bin/bash     
到此，Docker部署nodejs应用，已经完成。
