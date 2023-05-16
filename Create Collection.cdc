import CryptoPoops from 0x02
import NonFungibleToken from 0x02

transaction() {
  prepare(signer: AuthAccount) {
    signer.save(<- CryptoPoops.createEmptyCollection(), to: /storage/MyCollection)

    signer.link<&CryptoPoops.Collection{CryptoPoops.CollectionPub}>(/public/MyCollection, target: /storage/MyCollection)
  }

  execute {
    log("Collection Created!")
  }
}
