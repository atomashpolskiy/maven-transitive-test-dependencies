#!/bin/bash
cd project2
mvn clean install
cd ../project1
mvn dependency:tree -Dverbose
