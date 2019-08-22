FROM ruby:2.5
RUN apt-get update -qq && apt-get install -yqq nodejs postgresql-client
# Install Ubuntu yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn
RUN mkdir /app
WORKDIR /app

RUN gem install rails:5.1.6

# Add entrypoint script to fix Rails issue
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

RUN alias rserve="rails server -b 0.0.0.0 -p 3000"

CMD ["/bin/bash"]
