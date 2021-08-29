> 原链接：https://blog.csdn.net/qq_38410428/article/details/94719553

# torch.transforms

变换是常见的图像变换。它们可以使用链接在一起`Compose`。此外，还有`torchvision.transforms.functional`模块。功能转换可以对转换进行细粒度控制。如果您必须构建更复杂的转换管道（例如，在分段任务的情况下），这将非常有用。

```python
torchvision.transforms.Compose(transforms)
```

- transforms（Transform对象列表）-要组成的变换列表。

例子：

```python
transforms.Compose([
     transforms.CenterCrop(10),
     transforms.ToTensor(), ])
```

## 常见的图像变换

官方文档只是将方法陈列，没有归纳总结，顺序很乱，这里总结一共有四大类，方便大家索引：

- 裁剪（Crop）—— 中心裁剪：`transforms.CenterCrop` 随机裁剪：`transforms.RandomCrop` 随机长宽比裁剪：`transforms.RandomResizedCrop` 上下左右中心裁剪：`transforms.FiveCrop` 上下左右中心裁剪后翻转，`transforms.TenCrop`

- 翻转和旋转（Flip and Rotation） ——依概率p水平翻转：`transforms.RandomHorizontalFlip(p=0.5)` 依概率p垂直翻转：`transforms.RandomVerticalFlip(p=0.5)` 随机旋转：`transforms.RandomRotation`

- 图像变换（resize） ——`transforms.Resize` 标准化：`transforms.Normalize` 转为tensor，并归一化至[0-1]：`transforms.ToTensor` 填充：`transforms.Pad` 修改亮度、对比度和饱和度：`transforms.ColorJitter` 转灰度图：`transforms.Grayscale` 线性变换：
`transforms.LinearTransformation()` 仿射变换：`transforms.RandomAffine` 依概率p转为灰度图：`transforms.RandomGrayscale` 将数据转换为PILImage：`transforms.ToPILImage` `transforms.Lambda`：Apply a user-defined lambda as a transform.

- 对transforms操作，使数据增强更灵活 `transforms.RandomChoice(transforms)`， 从给定的一系列transforms中选一个进行操作 `transforms.RandomApply(transforms, p=0.5)`，给一个transform加上概率，依概率进行操作 `transforms.RandomOrder`，将transforms中的操作随机打乱

