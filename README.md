🌟 Flask Deployment Template with Ubuntu & Gunicorn 🚀

Welcome to the Flask-Ubuntu-Multi-Prod template! 🎉 This repository provides a ready-to-use structure for deploying Flask applications with Gunicorn on an Ubuntu base image. Perfect for developers who want a streamlined setup for production. 🛠️

📖 Table of Contents

Overview

Features

Prerequisites

Setup Instructions

Project Structure

Usage

License

🌍 Overview

This project simplifies the deployment of Flask apps using:

Gunicorn 🐍: A powerful WSGI HTTP server for running Python web applications.

Ubuntu 🐧: A stable and widely-used Linux distribution.

NGINX 🌐: Used as a reverse proxy for handling incoming requests.

Certbot 🔐: Automatically configures SSL certificates with Let's Encrypt.

💡 Why use this? It’s a quick way to get your Flask app running in a production-ready environment!

✨ Features

📦 Multi-stage Docker builds for optimized images.

🔐 SSL Certificate generation with Certbot.

🛡️ Reverse proxy setup with NGINX for handling static files and requests.

🖥️ Ubuntu 22.04 base image for stability and compatibility.

🧩 Flexible structure to adapt to your project needs.

✅ Prerequisites

Before you begin, make sure you have:

🐳 Docker installed (Get Docker).

📂 Basic understanding of Flask applications.

🌐 A domain name pointing to your server.

⚙️ Setup Instructions

Follow these steps to get started:

1️⃣ Clone the repository

git clone https://github.com/yourusername/flask-ubuntu-multi-prod.git
cd flask-ubuntu-multi-prod

2️⃣ Build the Docker images

docker-compose build

3️⃣ Generate SSL Certificates

Run the following command to generate Let's Encrypt certificates:

docker run --rm -it \
  -v $(pwd)/certs:/etc/letsencrypt \
  certbot/certbot certonly \
  --standalone \
  --preferred-challenges http \
  -d yourdomain.com

Replace yourdomain.com with your actual domain.

4️⃣ Start the services

docker-compose up -d

Your app should now be running! 🎉

🗂️ Project Structure

Here's an overview of the file structure:

.
├── Dockerfile               # Multi-stage build for Flask app
├── nginx/                   # NGINX configuration files
│   └── default.conf         # Reverse proxy settings
├── certs/                   # SSL certificates storage
├── app/                     # Flask application folder
│   ├── app.py               # Main Flask app
│   ├── static/              # Static files (e.g., CSS, JS)
│   └── templates/           # HTML templates
├── docker-compose.yml       # Docker Compose setup
└── requirements.txt         # Python dependencies

🎮 Usage

Debugging the app

To view logs for debugging, use:

docker-compose logs -f

Stopping the services

docker-compose down

Updating the application

Update your code in the app/ directory.

Rebuild the Docker image:

docker-compose up --build

📜 License

This project is licensed under the MIT License. Feel free to use it and contribute! 🤗

🙌 Contributing

We welcome contributions! If you find a bug 🐛 or have an idea 💡 for improvement, feel free to open an issue or submit a pull request. ❤️

📧 Contact

For any questions, reach out at your-email@example.com.

Happy coding! 🚀
