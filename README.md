# SplashScreen

This is a little package that allows you to create an automatically fading splash screen. Basically, you want this to start off with the same static content that your LaunchScreen File has. When the LaunchScreen goes away this will be displayed and then you can make whatever changes to its content that you want.


Create a SplashContents struct that has your SplashScreen contents.

```
//This is where you can get creative about what is displayed.
struct SplashContents: View {
    var body: some View {
        Text("My App")
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}
```
In your Content file create a ZStack with your content and a call to SplashScreen passing in your SplashContents.

```
var body: some View {
    ZStack {
        MyAppView()
        SplashScreen() {
            SplashContents()
        }
    }
}
```

And that is all there is!
