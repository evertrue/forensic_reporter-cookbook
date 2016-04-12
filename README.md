# Forensic Reporter

![Detective Dog](http://ops.evertrue.com.s3.amazonaws.com/public/Detective-Dog--125703.jpg)

Installs an extremely simple service to email a report of some important system stats to `root` every minute whenever load average exceeds a certain (configurable) threshold.

# Usage

Include this recipe in a wrapper cookbook or run list

```ruby
include_recipe 'forensic_reporter'
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests with `kitchen test`, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Author:: Evertrue, Inc. (devops+cookbooks@evertrue.com)
