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
