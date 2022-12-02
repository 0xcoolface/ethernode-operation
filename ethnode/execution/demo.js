// get transaction count for a range of blocks
function gettcn(start,end) {
	for (i=start;i<= end;i++) {
		n = eth.getBlockTransactionCount(i);
		if (n > 0) {
			console.log("blockNumber : " + i + "     TxCount: " + n);
		}
	}
	return "done."
}

function help() {
	console.log("gettcn(start,end):\t get block's tx count.");
	return ""
}