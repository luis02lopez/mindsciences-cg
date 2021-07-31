Hello Adrian!

How to use this:

$ docker build -t mindsciences_challenge_luis:latest .

$ docker run --cap-add=NET_ADMIN -p 22:22 -p 5000:5000 mindsciences_challenge_luis

("NET_ADMIN" needed for docker firewall blocking)

Try sshing at least 3 times for a minute in another terminal session to simulate the brute-force attack:

$ ssh 0.0.0.0

SSH protection, monitor and alarming of CPU load is running with cron.

Monitor CPU and check list of banned IP's status page here: 

Open http://0.0.0.0:5000 in your browser
