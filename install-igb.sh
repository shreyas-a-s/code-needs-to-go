#!/usr/bin/env bash

sudo apt-get install -y openjdk-11-jdk apache2 maven

git clone https://bitbucket.org/lorainelab/integrated-genome-browser

cd integrated-genome-browser

sed -i '/maven.compiler.source/ c\        <maven.compiler.source>11</maven.compiler.source>' pom.xml
sed -i '/maven.compiler.target/ c\        <maven.compiler.target>11</maven.compiler.target>' pom.xml

sed -i '/maven.compiler.source/ c\        <maven.compiler.source>11</maven.compiler.source>' plugins/cache/pom.xml
sed -i '/maven.compiler.target/ c\        <maven.compiler.target>11</maven.compiler.target>' plugins/cache/pom.xml

sed -i '/maven.compiler.source/ c\        <maven.compiler.source>11</maven.compiler.source>' plugins/cache-api/pom.xml
sed -i '/maven.compiler.target/ c\        <maven.compiler.target>11</maven.compiler.target>' plugins/cache/pom.xml

mvn clean install -DskipTests=true

