pipeline{

    // 任意一个节点执行即可
    agent any

    environment  {
        WS = "${WORKSPACE}"
    }

    stages{
        stage('环境检查'){
            steps{
                echo "环境检查"
                sh 'pwd && ls -alh'
                sh 'printenv'
            }
        }

        stage('拉取代码'){
            steps{
                echo "拉取代码"
            }
        }

        stage('编译打包'){
            agent{
                docker {image 'maven:3-alpine'}
            }
            steps{
                echo "编译打包"
                sh 'mvn -v'
                sh 'cd ${WS} && mvn clean package -s "/var/jenkins_home/myconfig/maven/settings.xml"  -Dmaven.test.skip=true'
            }
        }

        stage('构建镜像'){
            steps {
                echo "构建镜像..."
                //检查Jenkins的docker命令是否能运行
                sh 'docker version'
                sh 'pwd && ls -alh'
                sh 'docker build -t springboot-devops .'
            }
        }

        stage('部署'){
            steps {
                echo "部署..."
                sh 'docker rm -f springboot-devops'
                sh 'docker run -d -p 8888:8888 --name springboot-devops springboot-devops'
            }

            //后置执行
//             post {
//               failure {
//                 // One or more steps need to be included within each condition's block.
//                 echo "炸了.. ."
//               }
//
//               success {
//                 echo "成了..."
//               }
//             }
        }

    }



}