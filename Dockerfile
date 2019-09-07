 
# Set python3 as base image
FROM python:3    

# Add source code to container
ADD ./debitos /opt/debitos
ADD ./requirements.txt /opt/debitos
 
# Set working direcory 
WORKDIR /opt/debitos

# Install python lib requirements
RUN pip install --no-cache-dir -r  requirements.txt

# Expose ports
EXPOSE 80
# default command to execute    
CMD exec gunicorn debitos.wsgi:application --bind 0.0.0.0:80 --workers 3