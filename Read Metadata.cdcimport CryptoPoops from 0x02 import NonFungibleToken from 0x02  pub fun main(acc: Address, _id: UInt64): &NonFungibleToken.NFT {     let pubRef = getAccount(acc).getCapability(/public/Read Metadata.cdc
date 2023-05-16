import CryptoPoops from 0x02
import NonFungibleToken from 0x02

pub fun main(acc: Address, _id: UInt64): &NonFungibleToken.NFT {
    let pubRef = getAccount(acc).getCapability(/public/MyCollection)
                    .borrow<&CryptoPoops.Collection{CryptoPoops.CollectionPub}>()
                    ?? panic("Collection doesn't exist here")

    let ids = pubRef.getIDs()

    let nft = pubRef.borrowAuthNFT(id: ids[_id])
    return nft
}
