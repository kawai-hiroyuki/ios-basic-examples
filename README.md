# iOS Basic Samples

## NSOperationSample
スレッド処理をするときに使用するNSOperationとNSOperationQueueの使い方

下記サイトを参考にしながらも、スレッド全てを実行してから次に遷移するwaitUntilAllOperationsAreFinishedの処理を追加した。

[NSOperationQueue スレッドと処理の関係 - A Day In The Life](http://d.hatena.ne.jp/glass-_-onion/20110527/1306499056)

NSOperationの参考としてアップルにも公式のサンプルがある。

[NSOperationSample - Apple Developer](https://developer.apple.com/library/mac/samplecode/NSOperationSample/Introduction/Intro.html)

## NSInvocationSample
動的にメソッドを作成したい場合に、NSInvocationを使うと便利です。
引数が２つのメソッドの場合はNSObjectのperformSelector:を使用すれば事足りるけれど、それ以上の場合はNSInvocationを使用する。

[iPhone アプリ研究会 NSInvocationで動的結合を体感](http://appteam.blog114.fc2.com/blog-entry-97.html)

## StoreKitSample
アプリ内で購入処理を行う場合の処理を記述
実機でなければ実行できない
iTunesConnectでアイテムを登録する必要がある
