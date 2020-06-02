FROM nodejs

WORKDIR /usr/src/my-app

ENV PATH=/opt/rh/rh-nodejs10/root/usr/bin/:${PATH}

COPY package.json /ur/src/my-app

RUN . /opt/rh/rh-nodejs10/enable && npm config set -g registry http://registry.npmjs.org/ && npm install --verbose

COPY . /usr/src/my-app
CMD /usr/src/my-app/node_modules/@angular/cli/bin/ng serve --watch --host 0.0.0.0 --proxy-config proxy.conf.json --port 4201