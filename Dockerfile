FROM maven AS build
WORKDIR /app
COPY . /app
RUN mvn package
COPY --from=build /app/target/*.war /user/local/tomcat/Webapps
