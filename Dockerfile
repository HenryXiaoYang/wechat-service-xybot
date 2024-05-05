FROM chisbread/wechat-service:latest

USER root

COPY root/ /

RUN bash -c "cd /home/app/; git clone https://github.com/HenryXiaoYang/XYBot.git"

RUN bash -c "cd /home/app/; python3 get-pip.py -i https://pypi.tuna.tsinghua.edu.cn/simple"

RUN bash -c "cd /home/app/XYBot/; pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple"

USER app

ENTRYPOINT ["/inj-entrypoint.sh"]