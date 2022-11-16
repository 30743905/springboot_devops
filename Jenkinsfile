pipeline{

    // 任意一个节点执行即可
    agent any

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
            }
        }

    }


}