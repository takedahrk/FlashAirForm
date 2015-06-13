function split(str)
  local params = {}
  
  --パラメータと値を連想配列に格納
  for i in str:gmatch("[^&]+") do  --&を条件に分割
    for k, v in i:gmatch("([^,]+)=([^,]+)") do  -- パラメータ名をキーとして値を格納
      params[k] = v
    end
  end

  return params
end

--パラメータの取得
local params = split(arg[1])

--ファイルを追記モードで開く
f = io.open("write.txt", "a")
--ファイルへ書き込み
f:write(params["no"])
f:write(",")
f:write(params["satisfaction"])
f:write("\r\n")
--ファイルを閉じる
f:close()

--レスポンスデータ
print("HTTP/1.1 200 OK\n")
print("write completed")