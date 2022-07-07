# BigData_Analysis_Development
빅데이터기반 AI(머신러닝,딥러닝) SW개발자

### Colab에서 R을 실행
https://colab.research.google.com/notebook#create=true&language=r


### Colab에서 Python을 실행
https://colab.research.google.com/notebook#create=true


### Python 시각화 한글

    # 한글 폰트 문제 해결 
    # matplotlib은 한글 폰트를 지원하지 않음
    # os정보
    import platform

    # font_manager : 폰트 관리 모듈
    # rc : 폰트 변경 모듈
    from matplotlib import font_manager, rc
    # unicode 설정
    plt.rcParams['axes.unicode_minus'] = False

    if platform.system() == 'Darwin':
        rc('font', family='AppleGothic') # os가 macos
    elif platform.system() == 'Windows':
        path = 'c:/Windows/Fonts/malgun.ttf' # os가 windows
        font_name = font_manager.FontProperties(fname=path).get_name()
        rc('font', family=font_name)
    else:
        print("Unknown System")
