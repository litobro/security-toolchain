docker run --rm -ti --network host \
	-v $PWD/work:/work \
	-v $PWD/connection:/connection \
	--cap-add=NET_ADMIN \
	--device /dev/net/tun:/dev/net/tun \
	security-toolchain \
	/bin/bash
