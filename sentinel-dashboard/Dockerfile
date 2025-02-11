FROM bellsoft/liberica-runtime-container:jdk-17.0.9-glibc

WORKDIR /app

COPY sentinel-dashboard.jar /app/sentinel-dashboard.jar

ENV PORT=33333
ENV JVM_OPTS="-Dserver.port=$PORT -Dcsp.sentinel.dashboard.server=localhost:$PORT -Dproject.name=sentinel-dashboard"

# 暴露应用运行的端口
EXPOSE $PORT

# 启动应用并将日志重定向到 log 文件
ENTRYPOINT ["sh", "-c", "nohup java ${JVM_OPTS} -jar sentinel-dashboard.jar > sentinel.log 2>&1 & tail -f sentinel.log"]