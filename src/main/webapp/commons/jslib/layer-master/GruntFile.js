﻿module.exports = function(grunt) {  

    // Project configuration.  
    grunt.initConfig({  
        pkg: grunt.file.readJSON('package.json'),
        
        //压缩js - layer
        uglify: {  
            options: {
                expand: true
            },
            'layer.js': {
                options: {
                     banner: '/*! layer-v<%= pkg.version %> <%= pkg.description %> License LGPL  <%= pkg.homepage %> By <%= pkg.author %> */\n;'
                },
                src: './src/layer.js',  
                dest: './layer.js'
            },
            'layer.ext.js': {
                options: {
                     banner: '/*! layer<%= pkg.description %>拓展类 */\n;'
                },
                src: './src/extend/layer.ext.js',  
                dest: './extend/layer.ext.js'
            },
            'layer.mobile.js': {
                options: {
                     banner: '/*! layer mobile-v<%= pkg.mobile %> <%= pkg.description %>移动版 License LGPL <%= pkg.homepage %>mobile By <%= pkg.author %> */\n;'
                },
                src: './src/mobile/layer.m.js',  
                dest: './mobile/layer.m.js'
            }
        },

        //压缩css
        cssmin: {
            options : { 
                compatibility : 'ie8', //设置兼容模式 
                noAdvanced : true //取消高级特性 
            }
            ,layer: {
                files: [{
                    expand: true,
                    cwd: './src/skin',
                    src: ['*.css', '!*.min.css'],
                    dest: './skin'
                }]
            }
        }
    });
  
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    
    grunt.registerTask('default', ['uglify', 'cssmin']);

  
};  