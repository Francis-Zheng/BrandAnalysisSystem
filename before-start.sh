#!/usr/bin/env bash

echo "品牌报告系统预操作..."
cd ./brand-report-backend/docker/
bash beforestart.sh

echo "品牌用户管理系统预操作..."
cd ../../brand-user-authorization-backend/docker/
bash beforestart.sh

echo "品牌调查问卷系统预操作..."
cd ../../BrandAnalysis-Questionnaire/docker/
bash before-start.sh

echo "品牌口碑分析前端部分预操作..."
cd ../../CNCommentFront/docker/
bash before-start.sh

echo "语料标注系统预操作..."
cd ../../corpus-label-system/docker/
bash before-start.sh

echo "品牌报告Web应用预操作"
cd ../../brand-report-web/docker
bash before-start.sh
