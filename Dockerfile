FROM centos:centos7

RUN $ curl https://pyenv.run | bash \
    && echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile \
    && echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile \
    && export PATH="$HOME/.pyenv/bin:$PATH" \
    && eval "$(pyenv init -)" \
    && eval "$(pyenv virtualenv-init -)" \
    && pyenv install 3.9.2 \
    && pyenv virtualenv 3.9.2 awsLambdaEnv \
    && mkdir /src/awsLambdaEnv \
    && cd mkdir /src/awsLambdaEnv \
    && pyenv activate awsLambdaEnv \
    && pip install pipenv \
    && pipenv install \
    && pipenv install pandas \
    && pipenv sync
