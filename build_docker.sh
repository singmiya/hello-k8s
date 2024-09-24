#!/bin/bash
RED='\033[0;31m'
RED='\033[0;32m'
NC='\033[0m' # No Color

APP_VERSION=$1

set -e

export BUILD_ID=dontKillMe

BASEDIR=$(cd `dirname "$0"`; pwd)
cd "$BASEDIR"

echo "脚本执行目录$BASEDIR"

if [[ "$#" != 1 ]];then
    echo "${RED}传参：版本号${NC}"
    exit
fi

if [[ ! -d "target" ]];then
    echo "${RED}target文件夹不存在，请先构建${NC}"
    exit
fi

if [[ ! -d "$BASEDIR/target/dependency" ]];then
    echo "解压jar包"
    mkdir -p ${BASEDIR}/target/dependency && (cd ${BASEDIR}/target/dependency; jar -xf ${BASEDIR}/target/*.jar)
fi

# 构建镜像
docker build -f ${BASEDIR}/Dockerfile -t crpi-vz0k442me5cpxdsf.cn-beijing.personal.cr.aliyuncs.com/singsmiya/hello-k8s:${APP_VERSION} -t crpi-vz0k442me5cpxdsf.cn-beijing.personal.cr.aliyuncs.com/singsmiya/hello-k8s:latest .
docker push crpi-vz0k442me5cpxdsf.cn-beijing.personal.cr.aliyuncs.com/singsmiya/hello-k8s:${APP_VERSION}
docker push crpi-vz0k442me5cpxdsf.cn-beijing.personal.cr.aliyuncs.com/singsmiya/hello-k8s:latest