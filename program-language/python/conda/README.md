# conda

## conda pack

> 参考：https://zhuanlan.zhihu.com/p/87344422

1. 打包

    ```bash
    conda pack -n open-mmlab --ignore-editable-pakages -o open-mmlab.tar.gz
    ```

2. 解包

	```bash
	cd ~/Documents
	mkdir -p open-mmlab
	tar -xzf open-mmlab.tar.gz -C open-mmlab
	
	cd ~/.bin/anaconda3/envs
	# 注意最后有个点，表示当前路径
	mv ~/Documents/open-mmlab .
	```

