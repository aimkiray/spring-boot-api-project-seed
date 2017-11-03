package ${basePackage}.controller;

import ${basePackage}.utils.Result;
import ${basePackage}.utils.ResultGenerator;
import ${basePackage}.model.${modelNameUpperCamel};
import ${basePackage}.service.${modelNameUpperCamel}Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by ${author} on ${date}.
*/
@RestController
@RequestMapping("${baseRequestMapping}")
public class ${modelNameUpperCamel}Controller {
    @Resource
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    @GetMapping("/add")
    public ModelAndView addPage() {
        return new ModelAndView("${modelNameLowerCamel}/${modelNameLowerCamel}_add.ftl");
    }

    @PostMapping
    public Result add(@RequestBody ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.save(${modelNameLowerCamel});
        return ResultGenerator.successResult();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        ${modelNameLowerCamel}Service.deleteById(id);
        return ResultGenerator.successResult();
    }

    @GetMapping("/update")
    public ModelAndView updatePage() {
        return new ModelAndView("${modelNameLowerCamel}/${modelNameLowerCamel}_update.ftl");
    }

    @PutMapping
    public Result update(@RequestBody ${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.update(${modelNameLowerCamel});
        return ResultGenerator.successResult();
    }

    @GetMapping("/{id}")
    public Result item(@PathVariable Integer id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.findById(id);
        return ResultGenerator.successResult(${modelNameLowerCamel});
    }

    @GetMapping("/list")
    public ModelAndView listPage() {
        return new ModelAndView("${modelNameLowerCamel}/${modelNameLowerCamel}_list.ftl");
    }

    @GetMapping
    public Result list(@RequestParam(defaultValue = "0") Integer page, @RequestParam(defaultValue = "0") Integer size) {
        page = page == null ? 1 : page;
        size = size == null ? 5 : size;
        PageHelper.startPage(page, size);
        List<${modelNameUpperCamel}> list = ${modelNameLowerCamel}Service.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return ResultGenerator.successResult(pageInfo);
    }
}
