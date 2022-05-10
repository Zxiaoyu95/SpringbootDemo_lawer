package com.web.law.service;

import com.web.law.domain.Vip;
import com.web.law.repository.VipRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName : VipService
 * @Description :
 * @Author : zxiaoyu
 * @Date: 2020-08-25 22:49
 */
@Service
public class VipService extends BaseService<Vip> {

    private VipRepository repository;

    @Autowired
    public VipService(VipRepository repository){
        this.repository = repository;
        super.init(repository);
    }
}
