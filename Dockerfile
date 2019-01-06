FROM node:8

RUN export PATH="$(yarn global bin):$PATH"

RUN yarn global add serverless && \
    yarn global add serverless-artillery

CMD ["/bin/sh", "-c", "bash"]

