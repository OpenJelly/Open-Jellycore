# Open-Jellycore
An open source version of the originally closed source Jellycore. This package handles all of the transpiling of Jelly -> Shortcuts.

## Why a brand new version?
You may see this package and ask, Why is this a brand new repository? 

The answer is quite simple, the old repository is extremely bloated and with 3 years of history I was not able to quickly ensure nothing sensitive was accidentally being leaked. Jellycore used to be closely linked to Jellycuts so a lot of the code is hard to understand and poorly documented. 

The creation of a new repository turned out to be faster and much more efficient then converting the old Jellycore into a repository that was safe to Open Source. Rewriting Jellycore also provided me the ability to document every piece of code so it is easy for anyone looking at it to understand. 

Even though this is a new repository, you will see parts of code that have been present since the original versions of Jellycuts. The information at the top of files is was kept when moving files.

## Features (Compared to Private Jellycore)
Because this is a brand new version of Jellycore, it does not currently support all of the original features of the Jelly languages. However, Open Jellycore will eventually have feature parody with the Private Jellycore versions.

| Feature                        | Open Jellycore | Private Jellycore |
| ------------------------------ | -------------- | ----------------- |
| Parse Jelly Files              | ✅             | ✅                |
| Comments                       | ✅             | ✅                |
| Function Calls                 | ✅             | ✅                |
| If Statements                  | ✅             | ✅                |
| Repeat Statements              | ✅             | ✅                |
| Repeat Each Statements         | ✅             | ✅                |
| Repeat Statement Variables     | ✅             | ✅                |
| Menus                          | ✅             | ✅                |
| Magic Variables                | ✅             | ✅                |
| Export Shortcut Plist          | ✅             | ✅                |
| Custom User Functions          | ✅             | ✅                |
| Custom User Macros             | ✅             | ✅                |
| Return Statements              | ✅             | ✅                |
| Objects                        | ❌             | ✅                |
| Import Third Party Libraries   | ✅             | ✅                |
| Read Icon and Color Flags      | ✅             | ✅                |
| Test Suite                     | ❌             | ✅                |
| Full Error Handling            | ❌             | ❌                |
| Full Source Documentation      | ✅             | ❌                |

# Using Jellycore in your own projects!
I have written this version of Jellycore with the intention of it being possible for others to use it across the Shortcuts ecosystem. It has also been built with as many Swift platform features as possible, attempting to not rely on Apple's Foundation framework, however at times it still does.

## Documentation
The entirety of Jellycore is documented using Doc-C. Online documentation is available at https://actuallytaylor.github.io/Open-Jellycore/documentation/open_jellycore/.

# Contributing
If you are curious about contributing or where to start, the Features header is a great place to look at what is still left! If you are looking for smaller things to fix, there are a plethora of `// TODO:` comments throughout the library that are all small fixes or additions that would be nice to have.
