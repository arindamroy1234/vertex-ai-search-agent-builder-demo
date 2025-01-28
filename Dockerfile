# Use a base image with Node.js and Python installed
FROM nikolaik/python-nodejs:python3.12-nodejs22

# Set working directories
WORKDIR /usr/src/app

# Copy backend requirements file and install dependencies
COPY backend/requirements.txt /usr/src/app/backend/
RUN pip install --no-cache-dir -r /usr/src/app/backend/requirements.txt

# Copy backend source code
COPY backend /usr/src/app/backend

# Copy frontend package files and install dependencies
COPY frontend/package.json frontend/package-lock.json /usr/src/app/frontend/
RUN cd /usr/src/app/frontend && npm install

# Build the React app
COPY frontend /usr/src/app/frontend
RUN cd /usr/src/app/frontend && npm run build

# Copy the built React app to a directory served by FastAPI
RUN mkdir -p /usr/src/app/backend/app/static
RUN cp -r /usr/src/app/frontend/build/* /usr/src/app/backend/app/static/

# Set the working directory to the backend
WORKDIR /usr/src/app/backend

# Expose the port for the FastAPI app
EXPOSE 8080

# Run FastAPI and serve the React app
#CMD ["fastapi","run","main.py", "--host", "0.0.0.0", "--port", "8000"]
CMD ["uvicorn","main:app", "--host", "0.0.0.0", "--port", "8080"]