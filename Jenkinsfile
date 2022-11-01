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
						rm -fr *
						docker system prune -a -f
						git init
						git clone https://github.com/ck-g/Jenkins-Assignment1.git .
						git checkout 2022q1
						docker build -t mycentos:1.0 .
						docker run -itdp 80:80 mycentos:1.0
					'''
				}
			}
		}
	}
}
