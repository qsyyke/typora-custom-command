 #!/bin/bash


#baseUrl=https://picture.xcye.xyz

#uploadUrl是你图片上传的接口 请确保此接口上传成功后，能直接返回字符串的图片地址，而不是json数据
uploadUrl=http://81.68.201.154:8090/typora/upload/single
num=0
imgUrls=()

for i in "$@"
do
  res=$(curl -X POST "$uploadUrl" -F "file=@$i" -v)
  imgUrls[$num]="$res"
  num=`expr $num + 1`
done

echo "Upload Success:"
for path in ${imgUrls[*]}
do
 echo "$path"
done