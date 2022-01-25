# SkiaUI4Delphi  
This project is still in initialization.  

## Progress
### Layout (YogaLayout)
YogaLayout is modified from [Neslib.Yoga](https://github.com/neslib/Neslib.Yoga) with designed-time editor and WYSIWYG in delphi IDE form.  
Usually do the layouts:
```
TLayout -> TYogaLayout(Aligned Client) -> TYogaLayout(Aligned None) -> Your Control(Aligned Client)
                                      |  
                                       -> TYogaLayout(Aligned None) -> Your Control(Aligned Client)
                                      |  
                                       -> TYogaLayout(Aligned None) -> Your Control(Aligned Client)
```
- [ ] Set parent and visible 
