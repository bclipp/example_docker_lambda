FROM centos:centos7

RUN yum install -y make git gcc zlib-devel bzip2-devel readline-devel sqlite-devel openssl-devel \
    && curl https://pyenv.run | bash \
    && export PATH="/root/.pyenv/bin:$PATH" >> ~/.bashrc \
    && eval "$(pyenv init -)" >> ~/.bashrc \
    && eval "$(pyenv virtualenv-init -)" >> ~/.bashrc \
    && export PATH="/root/.pyenv/bin:$PATH" \
    && eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv install 3.9.2 \
    && pyenv virtualenv 3.9.2 awsLambdaEnv \
    && mkdir /srv/awsLambdaEnv \
    && cd  /srv/awsLambdaEnv \
    && pyenv activate awsLambdaEnv \
    && pip install pipenv \
    && pipenv install \
    && pipenv install pandas \
    && pipenv sync
