import CryptoPoops from 0x02
import NonFungibleToken from 0x02

transaction(acc: Address, _name: String, _favFood: String, _luckyNo: Int) {
  prepare(signer: AuthAccount) {
    let minter = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)!

    let pubRef = getAccount(acc).getCapability(/public/MyCollection)
                    .borrow<&CryptoPoops.Collection{CryptoPoops.CollectionPub}>()
                    ?? panic("Collection doesn't exist here")

    pubRef.deposit(token: <- minter.createNFT(name: _name, favouriteFood: _favFood, luckyNumber: _luckyNo))
  }

  execute {
    log("NFT Minted")
  }
}
