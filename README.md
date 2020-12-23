# cicd-demo
## 这是什么?
本仓库用于与朋友分享Jenkins集成Kubernetes的简单实现，是本人博客园[文章](https://www.cnblogs.com/hellxz/p/easyway_jenkins_integration_k8s.html)的配套Demo

仓库中内容如下：
- helloworld级的Spring Boot程序源码（基于Maven构建）
- shell脚本，包含构建推送Docker镜像、远程部署等实现
- Jenkins声明式流水线脚本
- Dockerfile镜像构建脚本

## 主要流程
- #1、Jenkins执行Jenkinsfile
- #2、Jenkins构建运行期拉取本仓库源码，使用Maven命令构建制品
- #3、调用Shell脚本将制品制成 Docker Image，并推送私有仓库
- #4、远程部署镜像到 Kubernetes 集群中

## 如何使用？
1. fork本仓库
2. 在主分支上修改以下两个Shell脚本的常量部分，与实际环境对应上即可。
    - artifact2image.sh
    - deploy2k8s.sh
3. 如果不想改主分支，则创建新分支，在Jenkins选Jenkinsfile来源时使用该分支即可