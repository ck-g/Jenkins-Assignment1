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
						git checkout -f 2022q2
						chmod 755 *						
						docker run -itdp 90:80 --name myhttpd-90  mycentos:1.0
						git checkout -f 2022q3
						chmod 755 *						
						docker run -itdp 8081:80 --name myhttpd-8081  mycentos:1.0
						
					'''
				}
			}
		}
	}
}
