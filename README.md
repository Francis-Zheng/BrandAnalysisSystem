# BrandAnalysisSystem
品牌分析系统主项目

## 各个子系统及数据库URL
- 用户管理：localhost:8085
- 调查问卷：localhost:8086
- 分析报告：localhost:8087
- 口碑分析：
- MongoDB:localhost:27019
- Redis:localhost:6379


## 使用版本：
- docker: Docker version 18.09.5, build e8ff056
- docker-compose: docker-compose version 1.17.0, build ac53b73

## 启动方式：

- $ bash before-start.sh
- $ docker-compose up --build --force-recreate

## 停止系统：

- $ docker-compose stop

## 停止并删除镜像

- $ docker-compose down --rmi all

