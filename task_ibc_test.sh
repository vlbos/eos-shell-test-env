#!/usr/bin/env bash

contract_acnt=eos222333ibc
contract_folder=ibc

echo  -------------------- IBC TEST ------------------------

create_some_account(){
    create_one ${contract_acnt}
    for i in 1 2 3; do create_one eosaccount1${i}; done
}
create_some_account

set_contract(){
    cleos set contract ${contract_acnt} ${CONTRACTS_DIR}/${contract_folder} -x 1000 -p ${contract_acnt}
}
set_contract

action_test(){
#    action_ps_test
    echo
}





action_initchain_test(){
    cleos push action ${contract_acnt} initchain '{"init_block_header":"14cf1c470000000000ea305500000000062f9c9e9f5589364619ac9af9e50b018b9c609879ade49330a2275691160000000000000000000000000000000000000000000000000000000000000000ef67f883e6d8c1e5356221a03bc5799a5adf19c19ed36aad1c6bee74cfba894e000000000000001f2d1008ce467b1d98963e44841bcc9ab6d5de1d1a40b8b7cac6b79e0a9bbb222f7889df81549481349c985087a4a37e9b6ed7f4ef44cad155f143fbf45c4fb700",
    "init_producer_schedule":{"version":1,"producers":[{"producer_name":"111111111122","block_signing_key":"EOS7oddAcr4iyUvBHdhEaXjFra2sGypyVMekXJp2YuTd4gc7LUsUz"}]},
    "init_incr_merkle":{"node_count":3,"active_nodes":["00001e3bf0fc6e665ed48bb39967af815742ffe55a095069319d883e65d2bd95","00001e3bf0fc6e665ed48bb39967af815742ffe55a095069319d883e65d2bd96"]}
    }'  -p ${contract_acnt}

    cleos get table ${contract_acnt} ${contract_acnt} blockheaders
    cleos get table ${contract_acnt} ${contract_acnt} producers
    cleos get table ${contract_acnt} ${contract_acnt} incrmerkle
}


action_addheaders_test(){
#    cleos push action ${contract_acnt} addheaders '["0be6c81c470000000000ea3055000000000001bcf2f448225d099685f14da76803028926af04d2607eafcf609c265c0000000000000000000000000000000000000000000000000000000000000000747d103e24c96deb1beebc13eb31f7c2188126946c8677dfd1691af9f9c03ab1000000000000002012c4b681deb1646407a8e1a116da9af6c2dc2eb0c09235201625f2b55d7ad97a0f3e604dbacc285fb880d71279b29f8becce3ec35d1bb639df723921cb965247e7c81c470000000000ea3055000000000002b6dda92cdecfa3eb92205acd516d439ba256c8444bce5755c12b7737000000000000000000000000000000000000000000000000000000000000000070913048c1bd6bbbb4ee02321a01ad01314af13ec0d0da2197347c84c493d409000000000000001f317db9d74c2e81e486bc7f021c57a40633f7dd73700f7f063fc012531e8f6c524ce26da0847b6cbaabf145a95fff00e8149e407ee34649e7e843922ec7eb609ce8c81c470000000000ea3055000000000003472b6987ef3c4a9cbb128271281ee8c0bafd623848d71b1b41348934000000000000000000000000000000000000000000000000000000000000000058f4783013d61dc60baf21ef4fc65968969301076d0878f217e3c11b7c314c7700000000000000203f762c22992329a3aaabc8ff80cb49e2bca3c6cbff178b30b75ea87f318b843319b9bc762ff4b2754e9f52dc74bc4a40b361811902660aa486b2ffa9437df299e9c81c470000000000ea3055000000000004e722a22345d48560802b75040d8de5eb69c522523c1c7b0e07a11b8800000000000000000000000000000000000000000000000000000000000000009764d8ad5daed9acdd5faa26c85047566b2c8575617d7e6ccc8a80cc4e2b53af000000000000001f0bb44d68a69ffdcfc8d11b78cf1ae918dd63e81de4770eedf98b6146d16af5321d42863e5745ec86b0e8c19a2c7f4c1d82de55388c536482a48ae72e1f2e76b2eac81c470000000000ea305500000000000517b5de64b85244a997ca956487029f18cd64f0a50678982b10572d0d000000000000000000000000000000000000000000000000000000000000000096dca39cbafd1ecdc93331440d51b06bacdd23a197900a7e0a4a40b23bfcc8fb000000000000001f0a38366b00c8d538cff9f8e2841de0bdad029dfc86a480f6d3874b8397b35cff1923f67a6cb3cba901b745558f807c5d0d124a6d95352cc5d2f883acdf56099debc81c470000000000ea305500000000000678f811238eb302d5ca8cac92a7241d1d8e3b1def6e9c9240085dbd9f0000000000000000000000000000000000000000000000000000000000000000f34ed9946866a5f36d8be966424f5c88b53b210ad19e496f23158a2d0e750158000000000000002070c9330e30bff2e8e201f901a22855bc15f1a30b5beecae4a95d48bd0f08ef7b1b2bf7e2f494a076c946173b1085e1e12662b0e02577e2b73a9f63addda4c101ecc81c470000000000ea30550000000000077312f92e39665431c427277982e6e1513ae74b1bc9062ddc12f6309e0000000000000000000000000000000000000000000000000000000000000000c26dad80f7b456ca7a5c5a739871b5437e0cc6a615f5b8573152e0d9b5f9865d0000000000000020739923802f84d19705e4fbcf612c25a65f8704fcd04aa825bd500022a9be086828aaefc02c662ed972cd32904d9a8281b1e927fd5e28e303fbd84b5f68a71423edc81c470000000000ea305500000000000853f7fbbd39d64192197d1275b1360e3298813e565aa26f7625f3855d00000000000000000000000000000000000000000000000000000000000000007a545988c447621a4ebbf87cf14eed4e5357d1aab7a7235813275d2e88e328c000000000000000202aedd77ef8e0f0e5b85d1d8aa9bd8e3228bf2caa7d97b654d44737450964c42054342410039615c25a0cf57c8d97c959cc8459eb93b8422a97cbf5662ae72aa1eec81c470000000000ea3055000000000009d14cac145575a41e7009c46b33789e7a59fe380beff24bef974dbd6700000000000000000000000000000000000000000000000000000000000000002c2aea18060931d27bdc553be2924d7a77d3bdd2593a0f651e7e10abdff3089a000000000000001f4287be0680c1c47a9c2afd850b5911b423a52e0981dcf93d478e5d2ebf4298af599b94eaee1fbe0a752d27253e4520e90e5e8e83ecf8feeebcb478ac80fa6be9efc81c470000000000ea305500000000000ac9c180d4f2e4a2f1f41fc40ef75706617be410f32f3f87243d45014d0000000000000000000000000000000000000000000000000000000000000000fe127b8ce72b80f054ee81f6ab925f7b2ed64f79378b445d95635a1a950bcffb000000000000001f3f40657e0618b45f9585da4088b3fb3864c7cb7034e76b916f28ee390532915e37346d96502dff9113e31285822c5234a92053a6c6373fce4c6d5f4dae7f88e6f0c81c470000000000ea305500000000000b07e8eb0313b72d5f32584cc6ad7a223a19f7ac621029b8fb080b1919000000000000000000000000000000000000000000000000000000000000000068b4f9eb2e151516b8e0adbda3b5d29dc2bce43c2977aefa5d4b52a2d126b99e00000000000000205b47bf9fe1a628b239ed2d66a9f6e28526fb64fd51d618c6988abc8916b31cf126f7acd8adc6b0449119e6b42f4a7a28146de8005976cb6c6bb04d68708ce818"]' -p ${contract_acnt}

    cleos push action ${contract_acnt} addheaders '["01b3751f470000000000ea3055000000000001bcf2f448225d099685f14da76803028926af04d2607eafcf609c265c0000000000000000000000000000000000000000000000000000000000000000747d103e24c96deb1beebc13eb31f7c2188126946c8677dfd1691af9f9c03ab1000000000000001f1b7163450e672065046519199b1187a56ff24db585116e7b6489e959ae9269bb67537d409229922b091d149b8f4e584e1b659997f9eb45320b270de99179a1aa"]' -p ${contract_acnt}
    cleos push action ${contract_acnt} addheaders '[""]' -p ${contract_acnt}

}



action_header_test(){

# cleos push action ${contract_acnt} header '["af561d470000000000ea30550000000028f44770468fbc06e5b944d094a25885251bd2dd917da41905ed4fed7f1a000000000000000000000000000000000000000000000000000000000000000045ce449a1f5f9215d81bd7bb6c9be205bd61b4ded510c24a1cb10480823d22d7000000000000"]'  -p ${contract_acnt}
    cleos push action ${contract_acnt} header '["14cf1c470000000000ea305500000000062f9c9e9f5589364619ac9af9e50b018b9c609879ade49330a2275691160000000000000000000000000000000000000000000000000000000000000000ef67f883e6d8c1e5356221a03bc5799a5adf19c19ed36aad1c6bee74cfba894e000000000000001f2d1008ce467b1d98963e44841bcc9ab6d5de1d1a40b8b7cac6b79e0a9bbb222f7889df81549481349c985087a4a37e9b6ed7f4ef44cad155f143fbf45c4fb700"]'  -p ${contract_acnt}
    cleos get table ${contract_acnt} ${contract_acnt} blockheaders

}



















action_ps_test(){

    cleos push action ${contract_acnt} ps '{"params":{"version":1,"producers":[{"producer_name":"111111111111","block_signing_key":"EOS7oddAcr4iyUvBHdhEaXjFra2sGypyVMekXJp2YuTd4gc7LUsUz"}]}}' -p ${contract_acnt}
    cleos get table ${contract_acnt} ${contract_acnt} producers


    cleos push action ${contract_acnt} header '{"header":{"timestamp":123,"producer":"store","confirmed":1,"previous":"00000001405147477ab2f5f51cda427b638191c66d2c59aa392d5c2c98076cb0","transaction_mroot":"00000001405147477ab2f5f51cda427b638191c66d2c59aa392d5c2c98076cb0","action_mroot":"00000001405147477ab2f5f51cda427b638191c66d2c59aa392d5c2c98076cb0","schedule_version":1,"new_producers":"","header_extensions":[]}}' -p ${contract_acnt}

}

action_merkle_test(){
    cleos push action  ${contract_acnt} merkle '{"params":{ "node_count":0,"active_nodes":[]}}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"5209329302892569182278441589045987214553276121327238411040043610"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"2002830094190670678012698709261028169396178961481040015178815798"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"1370738826195036721363136108356902215481066218711631203411993254"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"1830665860100289845111512065420975494784225275941840335376309696"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"3938607621073226880100902100720851879379680217662057114902091824"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"4965864261006609540210367714892086236171002874567946941416718899"}' -p ${contract_acnt}
    cleos push action  ${contract_acnt} merkleadd '{"params":"1294600846521073181741849297764058775173110601259029412818464438"}' -p ${contract_acnt}

    cleos push action  ${contract_acnt} merkle '{"params":{ "node_count":1,"active_nodes":["00001e3bf0fc6e665ed48bb39967af815742ffe55a095069319d883e65d2bd95","00001e3bf0fc6e665ed48bb39967af815742ffe55a095069319d883e65d2bd96"]}}' -p ${contract_acnt}
    cleos get table ${contract_acnt} ${contract_acnt} incrmerkle
}


action_remoteibctrx_test(){
packed_transaction_receipt="005801000011010100205a935daf1916b5769857566f63320999a193d86d020a27a8e6c249d834dddd2a1dce74cf685b4214f7601a4961b3f5e93b2fbca724cbed9f367b5ccc3a0a41c4000057c3c1fe5b310bc3b38524000000000100a6823403ea3055000000572d3ccdcd010000000000ea305500000000a8ed3232250000000000ea3055103232374f8a3055102700000000000004454f5300000000046d656d6f00"

cleos push action  ${contract_acnt} remoteibctrx "[${packed_transaction_receipt}]" -p ${contract_acnt}


}


"005801000011010100205a935daf1916b5769857566f63320999a193d86d020a27a8e6c249d834dddd2a1dce74cf685b4214f7601a4961b3f5e93b2fbca724cbed9f367b5ccc3a0a41c4000057c3c1fe5b310bc3b38524000000000100a6823403ea3055000000572d3ccdcd010000000000ea305500000000a8ed3232250000000000ea3055103232374f8a3055102700000000000004454f5300000000046d656d6f00"






action_test