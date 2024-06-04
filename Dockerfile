FROM httpd:latest

#WORKDIR /my-app
#RUN apt update && apt upgrade -y
#RUN apt install git -y
#RUN git clone https://github.com/alirezatayebinejad/ecommerce-website-html-css.git
#RUN cd ecommerce-website-html-css && cp * -r /usr/local/apache2/htdocs


WORKDIR /app
RUN apt update && apt upgrade -y
COPY . .  
RUN  cp * -r /usr/local/apache2/htdocs/
