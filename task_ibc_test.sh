#!/usr/bin/env bash

contract_acnt=eos222333ibc
contract_folder=ibc

echo  -------------------- IBC TEST ------------------------

create_some_account(){
    create_one ${contract_acnt}

    create_one eosvoterbig1
    cleos transfer eosio eosvoterbig1 "200000100.0000 EOS"
    cleos system delegatebw eosvoterbig1 eosvoterbig1 "100000000.0000 EOS"  "100000000.0000 EOS"

    for i in a b c d e f g h i j; do
        name=eosvoter111${i}
        create_one ${name}
        cleos transfer eosio ${name} "10000100.0000 EOS"
        cleos system delegatebw ${name}  ${name}  "5000000.0000 EOS"  "5000000.0000 EOS"
    done
}
create_some_account

. ./bp_keys.sh

create_register_producers(){
    bunch=$1 # 1 or 2

    for i in a b c d e f g h i j k l m n o p q r s t u v w x y z; do
        sfx=${bunch}${i}
        bpname=producer11${sfx} && create_one ${bpname}
        var=p${sfx}_pri && import_key ${!var}
        var=p${sfx}_pub && cleos system regproducer ${bpname} ${!var} http://${bpname}.io
    done
}
create_register_producers 1
create_register_producers 2


vote_producers(){
p=producer11
producers1="${p}1a ${p}1b ${p}1c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
           ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t ${p}1u"

producers2="${p}2a ${p}2b ${p}2c ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
           ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t ${p}1u"

producers3="${p}2x ${p}2y ${p}2z ${p}1d ${p}1e ${p}1f ${p}1g ${p}1h ${p}1i ${p}1j
           ${p}1k ${p}1l ${p}1m ${p}1n ${p}1o ${p}1p ${p}1q ${p}1r ${p}1s ${p}1t ${p}1u"

cleos system voteproducer prods eosvoterbig1 ${producers1}

}



set_contract(){
    cleos set contract ${contract_acnt} ${CONTRACTS_DIR}/${contract_folder} -x 1000 -p ${contract_acnt}
}
#set_contract




action_test(){
#    action_ps_test
    echo
}

action_chaininit_test(){
header='"93c03b4710430857219de8ad0000000059af1f1d623999aeb9dc4e743f268009f52ccc5828ce80bf0a33342a1c4f00000000000000000000000000000000000000000000000000000000000000001f2b8a2ff5a019151d776643542711120c868e2fb7038d71372378c21b3059f8030000000000002018e4fa79bc85e958bf126dde9c81942eaec9a2fc424892fde811efe406f9cf515c98bac97cf3c77dba27d00b13835ef1b778b3be8caa5f0f5ab05964cb7be031"'
pending_schedule='{"version":3,"producers":[]}'
active_schedule='{"version":3,"producers":[{"producer_name":"producer111d","block_signing_key":"EOS7R6woULngUEGTSZiwU6bVTQ9S3QL7PNWUkHsHzQN4ZK8Sd5Z4S"},{"producer_name":"producer111e","block_signing_key":"EOS5jurQAScHY15Dar97ynuafyoYWnZZQwtrDihe72oHJFiEMT9qE"},{"producer_name":"producer111f","block_signing_key":"EOS5CcunRbAZHtwJz2DdPqFx7sMMhnZysChYvK5VXw63jXkkTyKx9"},{"producer_name":"producer111g","block_signing_key":"EOS8RtT5pitvw1ohGWEmd8PuUd2WU8r3s1wSayb3JqybEL8qGHVAN"},{"producer_name":"producer111h","block_signing_key":"EOS7emRzu58rH3c5y9CC5R3yeYMtTZTyzNEmGUkENNr1hmp8CJQSP"},{"producer_name":"producer111i","block_signing_key":"EOS5nEcaoGe6sSTR5XSkt825qMrGhYiZMyYqNnSW45yPC6adGxaBQ"},{"producer_name":"producer111j","block_signing_key":"EOS5TDZEjtqfiqiZdDikgQQjc2C3ZeFijyzpSFSLX1AmNGWbKAtpv"},{"producer_name":"producer111k","block_signing_key":"EOS8Ab17X1unSfw32TizCTqJBmrUHZ5c8YvR6UuYURiKLFeuEySBP"},{"producer_name":"producer111l","block_signing_key":"EOS8hAoDAqQLXX7ch5nDJxLeoUiQ2hq2SumW6sLHKW2nwjmcb1iGE"},{"producer_name":"producer111m","block_signing_key":"EOS8B6qCUS2GxiuAY6cUprhaxrN7JkYsJMC4qfCRhC9TewasU7sHb"},{"producer_name":"producer111n","block_signing_key":"EOS88P2JvJzYooCbNs3HriA6FUD5zxj1hPykG8T2i4fXtav3G8PS3"},{"producer_name":"producer111o","block_signing_key":"EOS788n77BLxcsM4sE5Mi42uKmBxC6ALVkyAoyPAmiAJm1bcH1hGR"},{"producer_name":"producer111p","block_signing_key":"EOS84g5TApfPqwLe8LTTDuypyhvi2Cf4ZpVvm4PHTxczMaL8LEVf5"},{"producer_name":"producer111q","block_signing_key":"EOS6HEqdDp9T5To52idjw7cjzEYhRZ1CZxy5DnhNgFY9JH3naBhAc"},{"producer_name":"producer111r","block_signing_key":"EOS6g73HDDHaW7X8jAbBBiGjkRxdqmfruBY4ST9FKr6z2BxgUGauV"},{"producer_name":"producer111s","block_signing_key":"EOS5f3DEYdmQ22cSFMrWKyHhLYKvHEpwppSEf4tKpQWzJx4CrJcKi"},{"producer_name":"producer111t","block_signing_key":"EOS63acPsuJy2Rn1MbXpGz78uuzfF6frj3jWeyykjkpuSBjy1HMtb"},{"producer_name":"producer111u","block_signing_key":"EOS6JNYvKigRgQemwW6aTS2qZNHjEHsRsuLTo2TVA935TtcaPD6xU"},{"producer_name":"producer112a","block_signing_key":"EOS6GSCJRSFPBG4nhXFxyE75FNBL18MpxzQc5gAGUjT8ipnfahGeS"},{"producer_name":"producer112b","block_signing_key":"EOS817hVJSH2zGsTfXP9CynNRYqdntUQTPy5o82NpqzGCooYsx4jP"},{"producer_name":"producer112c","block_signing_key":"EOS8fdPxQhHUo1oBPiSjFLRxbKdUmV4gmAjsPHAxPDmHZHk2SgbHd"}]}'
blockroot_merkle='{"_active_nodes":["000059af1f1d623999aeb9dc4e743f268009f52ccc5828ce80bf0a33342a1c4f","c40be94236036db025dcb2f79e7afd99593b4ebae1ea6521bddbf7a0ef159068","c3cb5eb444590e07c1fa361c062aa63b17cf3a47ac8f98454757c13ffc3bbcf3","46ecb4f71e3fcb181542d63ef5ebf2087110c185da207af148c5ec4de5d21d77","9b284d14d05cf112994d6201f0fad35853e98f6cdfdab54ef53c4954d8f0cc12","82f969886bd440a1cff601ba3ba33bb5f85b06a10f593c8dd8264ae4d95b6ca7","70cbd3df264250a7bd5500b7f51163dea61de4a14e8326edb5f3306ed27d589c","c80ac17289f9ff5e0df6374fa31a72520c3862b4caf491e37d4a2a554fa92b83","5ac4093e7fa391971285d3a29eaf005eb69f2307b7e41ddd3b0849a58b50ff78","d74b3921a9b333d27053e2d8c6ad4d10b0bac8dcb59f07c3e749512591f15780","bf95c5f618796d9c0be926adc5aacd4b74de8e46446b036acc8b011aba0a8aad"],"_node_count":22959}'
confirm_count='[1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14]'

cleos push action ${contract_acnt}  chaininit "[ $header,$active_schedule,$pending_schedule,$blockroot_merkle,$confirm_count]"  -p  ${contract_acnt}
cleos get table  ${contract_acnt}  ${contract_acnt} chaindb
cleos get table  ${contract_acnt}  ${contract_acnt} prodsches




header='"94c03b4710430857219de8ad0000000059b0adb346dcab5ba44dfba66faf96b116e37abf399c50d694d458ce0b56000000000000000000000000000000000000000000000000000000000000000079756d6695a1e1760a21c4b6b96ebdf59341f2c012d5c38b2cae3a9f4f47fcee030000000000001f58fa40e7e1e7e90cdd721f277d316f1130fb96e3c366ec46303fe09ce18144433bae868f7b22ff473b4a7a7580cf42f09c60563bf046392f8a22d80d62121344"'

cleos push action ${contract_acnt}  addheader "[ $header ]"  -p  ${contract_acnt}













}



action_forkdbinit_test(){
     cleos push action ${contract_acnt} forkdbinit '{"init_block_header":"14cf1c470000000000ea305500000000062f9c9e9f5589364619ac9af9e50b018b9c609879ade49330a2275691160000000000000000000000000000000000000000000000000000000000000000ef67f883e6d8c1e5356221a03bc5799a5adf19c19ed36aad1c6bee74cfba894e000000000000001f2d1008ce467b1d98963e44841bcc9ab6d5de1d1a40b8b7cac6b79e0a9bbb222f7889df81549481349c985087a4a37e9b6ed7f4ef44cad155f143fbf45c4fb700",
    "init_active_schedule":{"version":1,"producers":[{"producer_name":"111111111122","block_signing_key":"EOS7oddAcr4iyUvBHdhEaXjFra2sGypyVMekXJp2YuTd4gc7LUsUz"}]},
    "init_blockroot_merkle":{"node_count":3,"active_nodes":["00001e3bf0fc6e665ed48bb39967af815742ffe55a095069319d883e65d2bd95","00001e3bf0fc6e665ed48bb39967af815742ffe55a095069319d883e65d2bd96"]}
    }'  -p ${contract_acnt}

    cleos get table  ${contract_acnt}  ${contract_acnt} forkdb
    cleos get table  ${contract_acnt}  ${contract_acnt} prodsches
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

action_packedtrx_test(){
    cleos push action  ${contract_acnt} packedtrx '["005801000011010100205a935daf1916b5769857566f63320999a193d86d020a27a8e6c249d834dddd2a1dce74cf685b4214f7601a4961b3f5e93b2fbca724cbed9f367b5ccc3a0a41c4000057c3c1fe5b310bc3b38524000000000100a6823403ea3055000000572d3ccdcd010000000000ea305500000000a8ed3232250000000000ea3055103232374f8a3055102700000000000004454f5300000000046d656d6f00"]' -p ${contract_acnt}
    cleos push action  ${contract_acnt} packedtrx '["006b01000019010100203c965f6d1116bfc523acf561e8624fb4bb540241fc4a6ba3bce62e13ea3b10dd2c3e91c4c8c54f9fa37d361ad77b78e5090b0bcbca6ec286c05202274a991e5e000098012ab2025c6200209bbf6400000000010000000000ea305500409e9a2264b89a010000000000ea305500000000a8ed3232660000000000ea3055c0a6db0603ea305501000000010002c0ded2bc1f1305fb0faac5e6c03ee3a1924234985427b6167ca569d13df435cf0100000001000000010002c0ded2bc1f1305fb0faac5e6c03ee3a1924234985427b6167ca569d13df435cf0100000000"]'  -p ${contract_acnt}



    cleos push action  ${contract_acnt} packedtrx '["0100203c965f6d1116bfc523acf561e8624fb4bb540241fc4a6ba3bce62e13ea3b10dd2c3e91c4c8c54f9fa37d361ad77b78e5090b0bcbca6ec286c05202274a991e5e000098012ab2025c6200209bbf6400000000010000000000ea305500409e9a2264b89a010000000000ea305500000000a8ed3232660000000000ea3055c0a6db0603ea305501000000010002c0ded2bc1f1305fb0faac5e6c03ee3a1924234985427b6167ca569d13df435cf0100000001000000010002c0ded2bc1f1305fb0faac5e6c03ee3a1924234985427b6167ca569d13df435cf0100000000"]'   -p ${contract_acnt}

    cleos push action  ${contract_acnt} packedtrx '["006b01000019","0100203c965f6d1116bfc523acf561e8624fb4bb540241fc4a6ba3bce62e13ea3b10dd2c3e91c4c8c54f9fa37d361ad77b78e5090b0bcbca6ec286c05202274a991e5e000098012ab2025c6200209bbf6400000000010000000000ea305500409e9a2264b89a010000000000ea305500000000a8ed3232660000000000ea3055c0a6db0603ea305501000000010002c0ded2bc1f1305fb0faac5e6c03ee3a1924234985427b6167ca569d13df435cf0100000001000000010002c0ded2bc1f1305fb0faac5e6c03ee3a1924234985427b6167ca569d13df435cf0100000000"]'   -p ${contract_acnt}

    cleos push action  ${contract_acnt} packedtrx '["002c040000b309","0100206483e77969aca42d12d44dbc9b212a40bff35e3992f17aa2e83026d2cd02b23e651704e323997abd0cadddfd19b44caa66353af925361b85db1696931e30f0f90100eb4a78daed7c0d8c5cd775de7df7fdeebc19ed934d2b1b524defbc30f5d211e5d58f97acacd47c6bf347911852b21433ae93e57077a89dd9dd99e5cc2c7f529acb58b22318a923c036e0a6b1a3a2501c2b10ea1a7662b88945cb944c59726bc011e40216a02241eb3a69e0a070611b8ed5f39d73df9b37cb5d8a72a3a001b21267de7bf7de73cf3d7ff79c73cf1bff0fbcf75caf2e4efde5db15fd697ca8ef4cdd479f7b7eee839f79d251bfffbe5b5d79a0fee07fdd7cf3b39f2b3dfa22dd34facb0eb5398f39d71f75d7ceada9a31e7d9e932fbaf3d7cef1b7bb864fa58e3ad4a671ed9da33f67eda872ce1d0d70bdb64677e8475f0e5a345f2adc5a48e730f89cb49d059cf7cafd59fe7c2f4dba6641cb9ce718240fa34f064c1ffa1bfe1bdd66e764b5d73cb1daea35671bab830515f0a366b7dfeace36fafd666fa0423c8ae78fcd1e6f75e6675bd3b7aa084f92b9d55eafd919ccf69a73cdd6c9664f8df158ead81f74091e7a56f0a8468f5657e61b0379a6f12c586e2ecfad9c51316e2aadfe6c636eaebbda19a82a1e5c9be344b05b2b2d9a45108b161a7dc1b39a23d5699e1e30d81a23d5981bb4ba9d599aac31db6ffd7a535dc38f7bcdc6fc6ca94d7a5768fcfd4d19ce88c4fd2696d8596a759ab26ee0de6b2e774f0aeee378e6378e75892e7ebe8e7e7320c343ba4157b98b567aadcea03fbb24902ab3b3ab9d6e6f7e70fc662160383bdb3c51dc45b3b3cbab4b83e3b7a8c4de36e6e7cbb7fdd563c52d0ded348ba1d55962cde9d54e7f70bcdf52d732daf468a9db18d0c3d6e0b82030c6dd867d62db67d8834611358904f3c701fc7523cffafcecf5169bf9d6c932364b23d80c7aab9db9c1f1797ab4c576b87fa30e7d7af4063c3244c2d9634bddb9c5b98546ab33bbd2e835969b8366af4f97738bcd79c1cfdcff4add6aee2fdceeab5a789d766a3f55bbce5313ee8413aaf0a7b7f25f2db47f35fadbb66d7cbc464fc66be1f835e3716d5b6ddbb8e73b2b4e18faaea39ce03a77cdc9ce5f50f19acabef92127ff0a1f77aa607bb777462b22e242b3b1327bacd16fba0ef198258fc8e56abfb1b2b27446bdd59f7d77e7545b1d0a66df3dbf74f8a4ba1b0f1a6d75180f1af4e09e2ddce39d839b6e6a2cb5eeefcc9e6c2ccd0ed43bb770bff58fef7d83c059fffcbe3708b8f5cf7f79aceaa8cc8983b74ceebaf99fdf5079ee779ddb09ef47234faf79e7f49a73ee675576de594cddedcaa81dae4a54a6ea9ed13bdc28f567a287d2a01eea3d7a8fbbc7849fcc2606d9cbf4f7afdad98f5f7ef905e7ce9a6342ea548f3435cf9cffb1fbc08cbabba64c540f33a73e66bcb492396d8257c9820335a7eac66872879defa96981101a8fba60080d482b3464aca662065206a1aa3a8e09c3b1d88c813b89831b9a9d1056693cf3b2fd7bdbd9991fe7d7ea976bb2285ecaff8f0bf9081662e219755ff603be74b3a89d9976a6a6b532eeccda2e7782bed42ed71897d99486bbdc88ae835d6e02f698d00433e7f9ef2f7e7f9f09129d7a99a2691894f1921d937a92aff7653f7c5ac8e6551de0e5c584ea47bf846901b94e6089f9897b77f6cc57d071777228f530b7321e439826489ef18180671ce0c4f2423d128234d1369a3af13dcd4e23a6dad9240d3a6a6fa6f57b8aab237cf54d45970b74e965095d0d7035ad57f881a107a7a9cf77559b3ebfaddac99b2c1a324969d1840e210e990dedac09b16d5adfc0e4e121493b1da341f7125dc6885dce59c2312e4f27300162973b454f68f811d09740b8d9f676aa27b54ac7e87ab24d5787040e283186ae093528801a03446534f176a2cd3c9cd42b752f6ff6488234cd4bab2b9636d5164a243fbfbef3de9a432c4aee8e81c4a43669656f4dad4389a46a5f4d913c7ad9423bf5e8114b20e487fa8ded05a204c1548cb7bfa6646a74820c980a644063018ae7a1d6f34e7bbb8abfe5ba1e9908bd4646626a31d575d7e8ed00a826f504cda9b2eb0125f5f701219addcf4ee38171f69142918c00197fbf083beea91f3fc4d43e2f9acc8e3f1e1b92c74c253512da7f7a3273fad9e3103d5ea397fd8677470d88cdd635b0d5f468bc9dad9c20840847e3e04952db4adcd2d3ba2a5fd00d7a4cb44f58807d0870647c9163fe4ae46b42be8cf18d8264bb56c649e10855c8e3765c4d6bc30f0c8bbfe5dc443bd94fe31c9231e9c383ac1006a2add4e8590902b9d210048be8dae41214418b23fa720a099aa03b1fec084d64250874382472a3a064ae7c301e1ea44608050225c76208ca44ddb1d0686e0722e0087385eaf17fd48e07ce264c48f05411831d16a749a2207d788b59f88bd98fc00cbe056d92602bb1127744a794b024ed6793c1060103fdf5a334abebc8400ca319bdbff719a3ba7a8519d5060335490209db63aee3af092f27051cc159cc2696531fd63ec8fef0f9c79e0753b3c770215b27cf6aa49b97fdd963cfbfe94ee245800d6240a68a2cf71ddbd290b53ccc26969243a4951a7b43688db451c9bb21e860500055617920619c584a89208e09f0c0b14698e408dc5710268f21b649d71c12977a60c5d063add5827f08a5f40cd16ba15d7748897561425c6b420091bf880ad4cc3a2ef711ee57726bef3008e3d5692fb48686e775f2396977643163450eeb906548bde2765986024c5fec5668b458b5102841730854985bb5a148d374980c0652e3a1a687f16762173e8e0b117f893c1c6f3bbc005f5c9b806d3cb67bb65bd1861e01d4989d8ba8e4118cd523da342bc64f636ce7be890b8f809adc616778040c81c4131e010d818cc434a4221e41c59441e41e41850cb2b83662e3772a05e93ac1a6d33959f7413b17aae3c7f4e437f41dd91f7d497674b2eed9438e751b3cb80da70d6fdde7618dd96f209d598058ec725768002816c1872936d1903c075f3c070fdbadf1931d690ce7816fadf71013ca6a7ff60df61ae21dae4954ee834557f2c1fc57f2bfc6d6f95f63ec7f81da552155b544ed4dfcaf32b5ab656a97418c50fbb79fc43a22f85f8ff06580454577677f2a0db84bf0a1defbaeec057e5626c9fb2eb1edd8e12ec06bfaf4a5218434bc3bfbc433dc9f879be82c38a02024f66fcf7dd933cf5832aae2e905f5ceec5bfc188b4a190308d3ddd99fcb6434f7c38e38565f2f6ea7f573a5eb4b727d09d7dfc475ccdbd95db89ad607f881617b7a18dd88d75ef64d070e162dee8619954f91f82c25bc58785015eb41556815d683f2c571f4e0c0c04657d800a7b1b50b100c768cd96b3315fb98c5f00890dce11e81e1523c0df588929d34a7cff2641c0882ca4104bc82ec85a794ac81c61e10608c2eb9023732f8c3b069bbdc035942db7f859de01dee61f4ac0cc79071a2ffd3aa890b94461c5a7674f96a823aefa6bd3639b2d5d285b6df6a3ecaf2228d05245df9d644fab9b5ae8074bee550c572c7cfb9b7c39dd8e53e6c2fcd2ef763f6727297fb88bddcbdcbfdb423eabc5b54f6f3cfbfffbffcf783c262c12179333ca69dead30e190c5842e2a412cf910cfa2527f5f7b2b1173c7cd84e2c8b4c8cedef651754bb3ce6bc93c6b9bbe9650f42a5d8e333b1586671f160992b76add4110eaaa9003a89066f031e3c4af6fa60bd6298ae2aa450e548bcc40ee77f0e5c674d8bc3f975c5365ba4c6948dda8450c1e4368d43119875da1d998189385c1021e3805217fef7a7bef1d0cd06569fec9bcaed1b09854aa652da9212becb6323277be6ab1c0f0d1b0a1d8fca3aaea0e34eaee322a52c3a67e1fea922262ba9b9da58cd1da839b796d49c10b17e09c283c22f51ecfa1c1869cda29e28b17422ccb7b006534b921015848c24828ab517c83aa2bde0b249c39a8651f587719f21bd1122c19350c3a80e7a2aeaa1fe1f10ccad812587e5909b53207572e4bd349cd65bb0df176bd0d602e97c0d082eac3d50c318ce410c4746665abfc3ca2f854b91b83ede3082d31099084e04bb4c1903d286e58d1ee7fef7a43e505779b3124f1cf169613ba7f0719122b89bd67766df4eb1a033ad71bf0e2372f545a114144a9c24bab60a557835e41229ab5012c029f1a4e84904fc959d86b407faf461d7458ec75d338a239f422fc897f4529d5d7307b6e5ecc5a7c0f06adde5f82aabe21ff9a4aee00dcbeb89f7491a5e0f802469a0ff81d4b32049cd02189134cc6edccf1b7d58c50ac9573bd4ce5e764e641e5cde303bdc1eb6fcde9a34fdb4343dba266de2f7664f3f5d24243c7889c4c6c7675e761e7890273501bbdbc6bdc3c696d291c6badc9996e02e66fe1279958f7f8091a425d508b519ea25cb573b55951cf61b3974257865440342946763f79b9b736cb71ee276c2360d6c17ba454b42c11721fe0010e775c81ae2dc2c780fb2a0aaf83f781444c0292d0c9cf8ea1ca26696c8591e3c680e6708dfc53482144499b74a1e1aac87730851367cf28874158e8f37e03d4689d447f255e5d5b3ffcd80d28002becc8109a4d883c48a75967c6d5a12f516810a204437589f9c655be0d26cd61263a3db9edfe4dba6ec949875d22e88bff4ad9cab0006e4cf920690234b3c774e6c234c0c31dee8c7595f6e6dd735fbfb0e1eaa99f0a154c1b953a22f21eb0139a90778df122dc1288e2d447a3448170b12f7ca177c018d6c93279a310dd5434873a0505edaf6923ba4959796fc2274f5305195beee35e162728d6c8887d350f650061f161be5adf639bc0456c461d364de74c3654d51095a959f632f84ee8ec76cee10f93d514ac398d7220d63fe0ed330bc6fac4bb71811f02cbc33bbc81b828fdd0472e7ce58dfeaf4892cda6f5bdd3c89287d7cc4fa1329274938d9b245922d09f29f36d332219996eaabceb424579369498a744b95adfbfa4c4b92675a9275991621ec3fa60dfe01a50d3e1cb9723442caf6881c8cf0e181f30fe64444b60d6cc79ea40d3ca40d5822b09948c2bf9c36403e1b8ed9f0b461b728e69ed269c3a49c364c2166bef279c3249f37a4153971981ce60c2ac819fc80c3e74a9e33705e3167e031a9830d491d30a1b04197484d9b9725b5163ae982d4217b2f4189d40c211821b52e93ba0c6284d4a59cc1ef7c596c5aa5943328ad5e4207b26193c3d0413a233df0d7ecfe57382836d17b37881b3ef1554bb1d1b8e1b35f2dd20321432ba50790c4a69d8cd303e78bdb697d7678799a2fbf8fcb87d0a3c2c9818f3872e8f1b03c32a4d1d3fa63b06e88ad5d649792376171c80fd839383f10f262373960f12478870d455ac0630b902b3fda82fc4487bbcac191b5ea2e87c68839e40c27b9458e41f6948f41c8ebfe49cf4124deddf420e4118e4bffd8a5b8d41dc6a5382de5f58aca70ccb9e1391d9fd2b1b903bb3d6251f6f18b2ab9352d22c5d4ff95ec73178b68d32d459bee48b42961551ae42263dd4affbde2117b978b8cda586478cff4360b35dd5224e75e16c9b936927347434d635b1296058f9976af3d7c84f1f7ac24e42758e1c809d64f1400b9570c805c1b00fda1e3786bb9a7e4169e92977b4a5e9ebe48032107b24da49e387e3385cb441b1a76bb000c52d69c91d7aff6134a74311e4b6a5318c2741d46b4ced03442a8a630db100a32b8168c1f7fd81f73d650f653fe4712f75d92387f3b6fd5f7649f6763e3242047987dfdcbb9a048c840e0be9d5b725f381d2117e643368f884376140e19cbe601ea0ef737cabe4370a649559c8422de049b970bd9ac5cc930c7af943aafae4b9d5739751e9a38adc1aac6a65618e6ea66a973a4c6310486b946434231cca12983c80d730857480c730586f96fbf2c699ab1a1611667169b632c9b638ccd318610e1b8a71e23b55d6c8e448bb13a78b49b8d13c4390d41982adb28c97afa62d64c557cdd88cf14f1b51b6e0a3727b7d0d724f7da6078b46e78245f93c8b37033521426de2649d1497d34ade5fae3677f41a60f7e5b4ab410058a21d3b1b84d71ae401c66707c5133312b908f3803bd78f1b53acb790d8213a39b8f73e9d7408326af5e83ac73b14e837660b6c98d35e88bbe9f6b0edbeaf372ee63dcc426a17dc92a8da413f748a47ac0a6132569c49e9e0f1e4af09b7d856cf4f40e4934aa7c97b7b949f2e037cf4e8645a1844d4b92092b2725fdcb3392ebf29192350a6cca09912c9762e074272cf275886da7f53c87b811975be08af7f7058ec9b4c4645a62325d64f638de24faed16d02b92fc8e6c020d606867dd9246d3fa3d167fce5a8d89d10e6c68a52489462e4c91445b81fc02d7318ea36c126d8523766ed62349b4ef72e4fd127f7e2bcfa2957bef95902bcfa2051b64d1c89f131de06044f3fe40d75607147480b787c0e8912c1a071601028b48c2095d44e80730519eff7e4efdc4135d529bcf24e97152b6ef69df5dd343f94d8a685f02203933a72b9665da95ff8a77749f9dd83c6574656f395ae72d47d65b0e2530094702934dbce550bce5500293705d60126e1698c01872a06945301da318300db70fd3c8213c43f13c1c39df2f9ac6287eb45e223a482ebea446889677883f29e517845e9278923a0ed03bb9b726092c5a465ef923c7fa9fd3ae53aa738177870dd61d96608974b38797e4490b1b1bc1fba2652a767cca8aad250d4deaad6d6844ccb6a70d6e61bd68ec7eeaf0e2c5dc633b9c7dea29de7ab28f3f2bdf4f3ccb1b97785a703b93ca08c8adb0af2ab94dbcab093ee4b1ded5f5649b4451fdabf2aefcc2bb9a187a573ebcab40d2246a584212ff50dbbc14720cecd3bcf86cbe0ad8a50f3e67ddda094831e691c48c374c56e5692818568eb083f7cf9cd7ef467e2acf464fb4f3b23dac01fbe9e1366f9bb410970c7a6487e72379bfd148041371f6677ff29cddf5410fc353233b6068a8cbbba9ecc1f6b02ecf17b8c80709715c10c7952df1749b6b828ab3bd9536efcff93127eff5a96fb7d705a099ef979c3fa2165bf885b618f135af22cfc35976f0211d9f8b91c8718682c1304220f596643c7ec0759c3c894cf29abc910f489029cd73fca0b7b86fbff7df3e7b51dd0716db5df5b9c71e5dc3266defbff785fffa05bad7722fa78af7d42c4277d197834c2987620720ff0ebbfb493bb97d6bd58f73288f6096020addffcf8ffd1fba77f3fb8ffedbef3c45f8d9bab6f7d097b605807cfaab046cf20b5bab5e2c7dde415fee34f38dfaec81cec9d4e450fd8badb050dc0db965d2f329e93605c749ba91a2bc6dabd09bbadd4e5f24c2bba5db6eecd0d2cdb4933d5bb9a802ddeea5af002963ee76581263529199645bc9a025409d53b4f1175ca9a0b27922e3a6d83b3509c36924a2f59e241e2aa36f33a87e9e4145395939834ae29354b7dabd82d6686b2eb131e6ee859c6b5b6f055f47e46b41f6eedbe58b7772e3db343732d21cd07b0219d5655ca62927c6efc80fe252d68e3de25cc87973241b131a039b1cb48d91d494f0b937f92c6c63dce25800a952e96acf03ece9000d3cefa4f65c5de507dee2a47c44ae272cae72960f7c93bdf9592ee76569b3804fb0532dc07f6775d2c9b1f243a99704d9f8209b2e3988379a53eaf63a7ec17582dc4574e1ac6e57921ef3f99044929ef88f7828ceb3647dc9e502ff38d3aa59b8a865948da165e36ece87b8968f9250cbcfef87b9703e31b0e9f0303b7d228d869970cf061ea57236d97ba22c19f6e16c79d2ce774e2926b0e70dc5f1a5e50b61d7dee8c446f3890d277488db5c036c0b223c56bdc32c127c46f312f73151b9c761f614d9c665ce6a9badbd6f6b0a203826e0ed24b08ce14c8f05843dd4117c2510720aa84753a7709e519f6b3de4e05ac5218d5528cec25b0f2a73e2ffa1e578ed827aad183b23126cbdfc198e1846186a0a86dac269e6ab5be2eb6881a2ad3571cb4c356dc99ae77cf5b22da3dc1c656524ac54c2ca84cb48c02d3288f5612dc96eceff5f9941426692497218af753620f40525847ed15abf872fb37e0b7f07d6ef4a26af64ddd8dcf965e223a1a14794c51f395df2464f97a4b6536ca768ce6159be2042bbdcccd657309122d01b98c895c27ebe0a0bb9523290e7c5287e1b06f2c1a18164d37bbe3090fb36369047363290478606f2a5a1817cb86420ed75fc84d6bebc1ff2da6ad254ae50232a3439cac48855a8ccc451abc80447aa8ba0c155129e2aab8b65454984b291c8ce042b465d49b1d86e817bd51ab2b121caf5e337bdd7463f2ea8917d85cde850590e8cec344365b1e1fdd4a8b25c182a0bb4240dca24bea036da7c121394ed5472d9e6935833c4a27a6b5e187381b53a5726d1a4dd85b24c0d5d9dcb35496daa49c93a4d4a84c713254d329b6a5232aa49a80078fb6ba2491fb7ae8691427b2d15fe5a88a9987cc92f6d1dfaedb9f78e708f3e92d45d4c3d0ed1c009a68bce99bf72a8869c5605f1bde6b3e1db143a3abdba0f841da9ed23b7dcc9d45b1d397ca5d0ca8d857c2bc4f3e410341a35353d796bc547ed88463e096785c82a4b26808b91011fe5377c68435f50ee350a9b38e8311e21789b1299cee756766e8835852f11f79003698f6b0e925fc9cf84a3e28c588ea5a56425412992079cd70fb7cbc9a1b8f6dc79a6343267dcbb58895c2e1fe0d35f399d57f167341749e93c9c121e196bf071785dc4779294307268253b071f552747ea08d4a7244b5c74d75ccb39c5b91bcedca4fc61ed8ba474d47a33237922209b7b63410eba0c780a1b95660576687aaea820e52877392c07696c018cba56ab5cb076aa3d962f96434c228a8523926127af06b5dca247ba2849b157f187b4e35ec5bb23b9a171edbb141bbd90a1367a21231fc8c7fa9b8cbdc2a064c341b01a9eb179501ee89646e9d1a9b8f44333bfd5e5f37255098c997d31e43f4186f4e632343122438995a148ea0af8ad041125f32a4529582f4ac1954529bc0a510a8414e106a2e4b33005244cee2b0853f02a84e951fb22d246848b4608c7f6dc922a7995a4f2d693cabb32a9fcab2095f8f1b6447c94541afbceb5de2b90c97b15647ae2eaded7baa2ced9b7a74a2ae06fae02ae95ffe8ea5edbfafb9838baa2b1d8cc525825fda2a67db8b4c1029e943379b4c51ae71027546d7516f19f4bb3d6eeaa69cea4875c68426c45f524ce425da9c7d2a8c7d2500ba9c722ae86b4a3723935ea93ea8af37cbc6909d79036b78551b4713a3555f5e2bc704b0f0bb7e0b6a26ac2c03d59ac8b2397fa757708cf6ec0391caeca43b98acf3373ea57d6031774113e27861c90a267da06e5f85ed5b94a95cf6a02797395ed2e1fa7e7e552e371fc9b5767f4aff8fade958cfefab7f0da5763f4d70d4ada1b1b7db6e7b620a330fd57f3cae0d0dadf5958fb3fd63a90d0282705fc8e888bac89bd495ddc0658778adae57d09a4c851791b66deeae37cda6d9917a1c835ca8b5c9167dfc7a1d4ca09e38a6b33a9af2700905039ae22303cc3f5100feabf98c35b5b0f4f4e55f32436614950920345599d6f792885b3aef58f0a0f1073a66a4826373f9d51d9e976e931276d0aea69ce0d0bd1bde42e52868305e1ce8bab553663a84467fb97ba280a765114fcb83de80282f0ef02512408bef749140b5324428ba470e49e34cac20151eb6575a2779b1ae7e800a64515d871d9334229474c8b6b35908f332221ba63cba347f14843ae81671c23cee5b37b4ae08dfb4b163ceb194e1150554a604db84df4cae7b30562214d13dbf593b3f9efe4a8e9720aa0c29b45c395a58b06f02185fb49ecc9c6c59a5dac39c49a8362cd3c91575af350f9870b0f983458382b786817cea59cf9fa53675f4d8a2aa5ca9fedb6055eb09be186c26b0b34b24037eddbdeb07b8830962697238e8244cf3b4c227f43125d469f21baae88c6904ceb44e332325d9942108d82e5dee2504698648b693022021eafd40485fd40be8075295fd60774f12e06f04799ba3ba3365887664cefc8fee6b91cc914d59caceb9a0b146d853f564682fa3249aa3b78fc41fec9805002b2f37035e2e1ab1e6e8136b9709f4c036c750edb8e9239d0f91aad55e78a7a94111de410ce6b6381b2750d29a31791de21361db2bb70280411bd1baa9cd14c0e15ef7634d7936444b96da993cca60a27933842cd8832dfbf2bc549bfd1d7fad877a875af9c80c5014e1f0fc5d7944ed88fc5f2f4ee78d1d14379e1171eaa304ab0c0de9ddbf06695cce726bfba572a57ec647839871c355fd921a4bdbf9a1f22c2aa57b96ab65a2f7132e27287e49deb51b1cfef8b7d95242a7ed271ec8b3776434d8b028161648c036b2dd12adb501bfe92df377c4b67e5506e835cf125b3584a2eb40df721b470856b38a9d26deb6b8c8b4e21c4f7c82161ffc886f85c3e1dc99e8f109ccf91f954bd341a6bf8ae76c2b5e15b438c8af84eb0945ad6a05142e566155b75ce029b9d3b81ed28f716636af5f9248fb71170248befa8496d386188be7e5cbcb4e7e587c395fd9c8509f225b20be8b1afe4d4f1721621e056f94568a7cd8ba4c1c88538e44a330d4b8872dd1803f2f8159b1cc2de9a6b11076c875bc252abe636a90d465fcda4a1c61f3b274c74d23e87eb8ef088e8c8fb38bfd72165249c1c55863d9182f4c058d8310eefcb155e5ad90954f6a3e74881557c8be3ac65d759ce933033d168965f4b9dbdf21a1f4190dddb259efd4ba27efc3d871c5dc9316a927383fcad215b81b37df8484ca06416ddb3eb78f8785cbc39b1c605ba6dab79fcea157ea0e4048ecda146676dbd99978527808366b93a7d8286915b20ef8206cc688d8943c929d130100788d82c130ed3038661a40fde5274453c9148450e4d64f8749b3d0e362200a9da054889dd16f93eaea8ecb7be86d147e3af794e75cd16fb8ba77f214b750dbe195cc10b5f420e95ed9823de8bd7062af0b18cbb4da82de32e6648db8abe795975a98d5a16124504904ccd072fd8e26396666a140f4a3174fc3647dd73ad1d46b4415614b6f5ce9addd5741bc103361e1c929f3e614900b48832ec7d7ab2de522f4b410f5e3fc28ca4c1ee7f9cfd08810ab96dbc9f5ca255b2ea60b9f20ec5a52c8df80d2b36774b343e7b482aa00577a9ebda97fd7ba9d7e1c581d915ac03e32a061d507909facbcbc035898f4e30516a5c98c2d508ee2129914220e59998df5613c9a12e0ebfcf2903dbbc127e9b2fc68bc18ed8893bb61134a14acfda4de31ee4e0c56d435cda76bc3012f371fdb6c3f0b481818163cb9586c5e68e500d351efbb6c946aa4d240e88338eb9abeb888cd2c4f8dff84eb426d2507744a976aa070feeadf196f5d0410edbdec6ef9e65ce6dd492f17631c00c0f1de47294615a97907649fa4ea6dedb283038282f642fee515bf9e729e8e17ebc48c860dd58de0784e978e8a0b1453f0e71aeee0d819dc0fb80dfe7705413ea2461fea2bc688d5bceab824a8b78eb5ae501a2e67050d6515384bb5bc2dd05eeaee0ee89c07b323b5119e73e7413b6716040c2d62e16e4d382222cc8371116647c2c46dbc50431b8c06731b4168a56f689fdb272988b5a2042e29372efab6979879b85545ee8621735e0d85c582a02929d35ce22c5c73d7997cbb3fba8ed531213955d246d48c5472b9c3dabdb14edb012f8120c8b721b7178fc715b1188682e47db15cc9c615951be0e28b60d360a0c7581a1536068fb9431cc71d4c35cc185ccc66619bf1808fec991567c969c0cb155561a9ffb9043d444909ffdd6bf76d8a9ab2ee15202289dbbfab47bd8c8c7883562fbc2372ebf050c551195842586b65b1334c4357e62fccd4cb2784bab73b2b1d49a37fd33cbc7ba4ba6d3586e928ff3116a6a164dabfc9b78cb8da5a5eedcecf15e77993e9acd7973aad137f3cd7eebfe0edd0cbaa6db593a638e35cd1cf5a4278de38366cff04fed71d7b9eef2ca5273d0a44e0caa3168ced35c3fa0b9ae5f6e9cde29f398e5d5fe005056bafdd6a07512e87cf44b2aae0fba8bcd8e39d51a2ce4c83696f01391674cf374ab3fe853bf3fa27eff04bff2671668bee56eaf69060b8d8eb9f92dd3e6d89941137dbe417d6ebf1cd67cb7d9379dee4080dd60e608f4808673c763cde380d5eaf75781ce6f3fa9e26b73ea9c586d7406adc1197afec893981ee873cf6205e53e7f4a7db6da3957f04b99fd56b763965bfde5c6606e813abc401dd27c0061334794ee9bc6c9466ba9716ca9997343e18dac8d8832ba10eaf73b5f56f1cf3056bde6a0d5db18adcf53a789b946070307bd46a77f9c58472ced37978e53f3d7a9792bddda1ffcbc7c92ef5087d7af761843ea875f1d358b4d40fe5b6a119e16703742e0e31709814ed71c6b2c353a734dd33dd66ece0dcc719a0e42f2396a7e5df764b337df6b9ceae4bda8e12bd470dd664b7f911aef9ab1107bdd5385c4cc372188f3a6db339d26419511cdf91b4dc6bf376a4e753b6f1c901411928d0eb1e1f871c2e64602f9a9a7547ce3db8550734bdd7e938463aeb1da87a4350bec5b82c7af377b5d0c7a810605f825539266bcb51fffb3fea0d7eadc8f7e836ed72c75e99ac84652df30225656111f785ac56f1f2cb47a8366b3434c9e5b68f4081061dcea701f6399c64369516822991f40db881aa2836dc56fb5c7b796860b860405ba788a68316ceb3741f81ec387cafc9086de6219b2821f98656d6f51d7c6a0db9bc575010dbf87da9a25f6374fd3c8c7bfa2e29f6af67a040c84e725db61d44a8167ece3395d3f43d7b7d8b558dd9319fb803a60c1ea1e27667489ce3d5a5d67006c692445f37170aa4770e9e67d97883d97a1badc9d6f1d3fb329969fbe349cdb76bdcab9ff9c46be557e26b7977382e8d8b99fb4acd75a6ef4ce400bcca9055252810c12904512f804e113cfa8f8e71bc4b6e59501506dcc93e1ec8303acd434843486586fd51b94a211afa76e2d1654528f66ef3871905abe452daf2b5aa02db6e1afa961aa34097e96162b7885993ef155e896edbb7eb2cf52e31bca8da5f99ea1b69fb5e400174c93cc41cef82143a8e75f51cf9b961bf7775a83d579a132a3d458663b93ef054b4d0222a6fcd7a66f86b97896ace49566a0ab3e04e209eaf833b663ab4392b58c25967bc34e50a79d97490d83d854683e4871decd16b0f4bc4a99f9131af8961233e4978a7383c7ba8bdd72c349ff86c67af73707aaf473d7eaf3731bfcdcf507bcfcc98fdc6bf8a7a16fbbad71acf5e69b6ebc494561fec3cd4e682d96cf64f7d9a229ed774f759a3d0ffa1f8834e45fa29a4a07bcc349976b68f36e2daf2ecfcad624a0ae915f9a9e3b33db1f3468737683726b85868c742fc3f3659f75f5a0cbf751be4d48570f1b7c2006d4ebae343bcadd14dfb15e637976a571266f941d50e92b808cf26d4a791e7c1d1e7815a804cc92f7b7de6189c88c58fab3bd39c9f8efd19b4edad5f1dfd47d8fca0ab8f35f7ee60b3982f4f7ae9db77fed6b4364f003e7bb0f1dbcf666173f69ad0a0ee2efe1834fcbd3f544c7dfff058fc1d0a4"]'   -p ${contract_acnt}

}


transfers(){

for i in `seq 100 999`;do cleos transfer firstaccount ${contract_acnt} "0.0${i} EOS" -p firstaccount && sleep .1 ; done

}







action_test