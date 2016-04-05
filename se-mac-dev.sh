#!/bin/sh
echo "Setting up development environment for your Mac"
echo "beginning installation .... be sure to enter your password when prompted"
xcode-select –install

echo "xcode installed"

echo "installing homebrew - awesome tool for your mac"

ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”

brew doctor

brew tap homebrew/services

echo "brew is installed, i guess"

echo "installing nginx"

brew install nginx

echo "installing mongo"

brew install mongodb

mkdir -p /data/db

sudo chmod 0755 /data/db && sudo chown $USER /data/db

echo "installing php with postgres"

brew install php56 --with-postgres

echo "installing php mongo driver"

brew install php56-mongo

echo "#!/bin/sh
run_comm() {
	brew services $1 php56
	brew services $1 mongodb
	brew services $1 postgresql
}

if [[ $1 == 'start' ]]; then
	#statements
	run_comm $1

elif [[ $1 == 'stop' ]]; then
	#statements
	run_comm $1

elif [[ $1 == 'restart' ]]; then
	#statements
	run_comm $1
else
	echo "usage: sh dev.sh start|stop|restart" 
fi" > /Users/$USER/Desktop/dev.sh

echo "use the sh file created on your desktop to start|stop|restart the services"

echo "sh dev.sh start|stop|restart"

echo "To see the running services, type - brew services list"

echo "That's about it. You can now configure your nginx server"