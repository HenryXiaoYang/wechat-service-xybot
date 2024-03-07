FROM chisbread/wechat-service:latest

USER root

COPY start-xybot /bin/
COPY add-code-in-inj-entrypoint.sh /home/app/
COPY XYBot /home/app/XYBot

RUN /home/app/add-code-in-inj-entrypoint.sh
RUN bash -c "cd /home/app/; python3 get-pip.py -i https://pypi.tuna.tsinghua.edu.cn/simple"

RUN bash -c "cd /home/app/XYBot/; pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple"

USER app

ENTRYPOINT ["/inj-entrypoint.sh"]