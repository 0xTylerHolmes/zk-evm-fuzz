# start geth in POA dev mode, seal a block every 5 seconds
geth --dev --http --http.api eth,web3,net --dev.period 5 &

# give time for geth to start up
sleep 5;

# send coings from the coinbase to the fuzzer's pubkey
geth attach --exec "eth.sendTransaction({from: eth.coinbase, to: \"0xb02A2EdA1b317FBd16760128836B0Ac59B560e9D\", value: web3.toWei(500000000, \"ether\")})" /tmp/geth.ipc; 

# wait long enough for funding transaction to seal then start spamming TXs
sleep 6;
livefuzzer spam

