FROM node:alpine

WORKDIR /app

COPY package.json .

# Install dependencies based on the environment
ARG NODE_ENV
ENV NODE_ENV=${NODE_ENV}
RUN echo "NODE_ENV is ${NODE_ENV}"
RUN if [ "$NODE_ENV" = "development" ]; then \
    # Development Environment
    npm install; \
    npm i nodemon; \
  else \
    npm install --omit=dev; \
  fi

COPY . .

EXPOSE 80

# Default command (This command will be overridden by docker-compose).
CMD ["node", "src/index.js"]

#####
# The following command may be used to debug the build process:
#   sudo docker build --no-cache --progress=plain -t self .
#####