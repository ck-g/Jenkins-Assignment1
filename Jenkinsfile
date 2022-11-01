pipeline
{
	agent
	{
		label 
		{
			label 'Master'
			customWorkspace '/opt/project1'
		}
	}
	stages
	{
		stage('Docker-Cleanup')
		{
			steps
			{
				script
				{
					
					def exitCode = sh script: ' docker ps -a | grep -w myhttpd-80', returnStatus: true
					if ( exitCode == 0 ) 
					{
						sh 'docker stop myhttpd-80'
					}
					def exitCode1 = sh script: ' docker ps -a | grep -w myhttpd-90', returnStatus: true
					if ( exitCode1 == 0 ) 
					{
						sh 'docker stop myhttpd-90'
					}
					def exitCode2 = sh script: ' docker ps -a | grep -w myhttpd-8081', returnStatus: true
					if ( exitCode2 == 0 ) 
					{
						sh 'docker stop myhttpd-8081'
					}
					def exitCode3 = sh script: ' docker images | grep -w mycentos:1.0', returnStatus: true
					if ( exitCode3== 0 ) 
					{
						sh 'docker rmi mycentos:1.0'
						sh 'docker system prune -a -f'
                    			}
					
				}
			}
		}
		stage('Git-Checkout')
		{
			steps
			{
				script
				{
					sh '''
						docker system prune -a -f
						git checkout -f 2022q1
						chmod 755 *
						docker build -t mycentos:1.0 .
						docker run -itdp 80:80 --name myhttpd-80 mycentos:1.0
						docker cp index.html myhttpd-80:/var/www/html
						git branch
						cat index.html
						git checkout -f 2022q2
						chmod 755 *						
						docker run -itdp 90:80 --name myhttpd-90  mycentos:1.0
						docker cp index.html myhttpd-90:/var/www/html
						git branch
						cat index.html
						git checkout -f 2022q3
						chmod 755 *						
						docker run -itdp 8081:80 --name myhttpd-8081  mycentos:1.0
						docker cp index.html myhttpd-8081:/var/www/html
						git branch
						cat index.html
						
					'''
				}
			}
		}
	}
}
