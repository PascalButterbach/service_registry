FROM adoptopenjdk/openjdk15

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN chmod +x ./mvnw
RUN ./mvnw dependency:go-offline

COPY src ./src

EXPOSE 8761

CMD ["./mvnw", "spring-boot:run"]
