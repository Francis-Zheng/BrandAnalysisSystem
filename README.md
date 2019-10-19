# BrandAnalysisSystem
品牌报告系统主项目

## 1、各个子系统及数据库URL(以下使用的都是docker转发到宿主机的端口，不是docker内部网络的端口)
- 用户管理: `localhost:8085`
- 调查问卷: `localhost:8087 `
- 品牌报告后端: `localhost:8081`
- 品牌报告前端（含口碑分析）: `localhost:3000`
- 知识库构建、评论分析演示、文本情感极性计算演示: `localhost:5002`
- 语料标注系统: `localhost:5001`
- Mysql: `localhost:3307` <br> 
&ensp; 用户名: `root` <br>
&ensp; 密码: `ibm198720`
- MongoDB: `localhost:27019`
- Redis: `localhost:6379`


## 2、运行部署之前需要安装的依赖：
- docker: Docker version 18.09.5
- docker-compose: docker-compose version 1.17.0
- node: 11.15.0版本
- 使用淘宝镜像源(国内直接使用npm可能会下载某些依赖的时候失败或者很慢)：npm install -g cnpm --registry=https://registry.npm.taobao.org

## 3、在新的机器上部署时注意事项：
- 修改`BrandAnalysisSystem/brand-report-web/.env.development`文件, 将`REACT_APP_WORD_MOUTH_FRONT_BASE_URL`修改成该机器的对应的IP地址;
- 在`BrandAnalysisSystem/BrandAnalysis-Questionnaire/mysite/settings.py`, 在`ALLOWED_HOSTS = ['0.0.0.0', 'localhost']`变量中添加一个该机器的对应的IP地址;
- 在`BrandAnalysisSystem/CNCommentFront/conf.py`, 将`label_system_ip_in_docker_release = `修改成该机器的对应的IP地址;

## 3、系统启动方式：
按顺序执行以下命令。

- $ `bash before-start.sh`
- $ `docker-compose up`

如果要后台运行，请添加`-d`选项:
- $ `docker-compose up -d`

第一次启动由于要下载基础镜像及构建镜像，需要花费比较长的时间

## 4、查看各个容器运行情况：
- $ `docker stats`

## 5、查看本容器网络各个容器名和端口：
- $ `docker-compose ps`

```$xslt
                   Name                                 Command               State                       Ports                     
------------------------------------------------------------------------------------------------------------------------------------
brand-corpus-label-system                    python corpus_label_system.py    Up      0.0.0.0:5001->5001/tcp                        
brand-mongo-container                        docker-entrypoint.sh mongod      Up      0.0.0.0:27019->27017/tcp                      
brand-mysql-container                        docker-entrypoint.sh mysql ...   Up      0.0.0.0:3307->3306/tcp, 33060/tcp             
brand-questionniare-container                bash ./docker/docker-start.sh    Up      0.0.0.0:8087->8000/tcp                        
brand-redis-container                        docker-entrypoint.sh redis ...   Up      0.0.0.0:6379->6379/tcp                        
brand-report-backend-container               /bin/sh -c bash /tmp/entry ...   Up      0.0.0.0:8080->8080/tcp                        
brand-report-web-container                   docker-entrypoint.sh cnpm  ...   Up      0.0.0.0:3000->3000/tcp                        
brand-user-authorization-backend-container   /bin/sh -c bash /tmp/entry ...   Up      0.0.0.0:8085->8081/tcp                        
word-mouth-front-container                   /bin/sh -c bash /tmp/entry ...   Up      0.0.0.0:5000->5000/tcp, 0.0.0.0:5002->5002/tcp
```

## 6、单独关闭某个容器：
- $ `docker container ps`
- $ `docker container stop [容器名]`

## 7、修改源码之后，单独重新制作某个容器的镜像:
- $ `docker container stop [容器名]`
- $ `docker images` 
- $ `docker image rm [镜像名字]`

其中，brand-report-web、word-mouth-front、brand-questionniare、
知识库构建、评论分析演示、文本情感极性计算演示这几个模块的前端显示代码
在修改保存之后，是会自动重新编译前端界面的，无需重新制作镜像。
但是如果这些前端界面的其他系统配置文件发生改变，就需要重新制作镜像。

## 8、停止系统并删除已创建的容器：（慎重，因为之前的产生的数据是存在容器中的）
- $ `docker-compose down`

## 9、停止系统：
- $ `docker-compose stop`

## 10、停止并删除镜像
- $ `docker-compose down --rmi all`

