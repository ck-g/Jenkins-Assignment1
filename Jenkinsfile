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
						git checkout 2022q1
						chmod 755 *
						docker build -t mycentos:1.0 .
						docker run -itdp 80:80 mycentos:1.0
					'''
				}
			}
		}
	}
}
