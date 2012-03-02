// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.yutax77.model;

import com.yutax77.model.Review;
import com.yutax77.model.ReviewDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect ReviewDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ReviewDataOnDemand: @Component;
    
    private Random ReviewDataOnDemand.rnd = new SecureRandom();
    
    private List<Review> ReviewDataOnDemand.data;
    
    public Review ReviewDataOnDemand.getNewTransientReview(int index) {
        Review obj = new Review();
        setWriter(obj, index);
        return obj;
    }
    
    public void ReviewDataOnDemand.setWriter(Review obj, int index) {
        String writer = "writer_" + index;
        obj.setWriter(writer);
    }
    
    public Review ReviewDataOnDemand.getSpecificReview(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Review obj = data.get(index);
        Long id = obj.getId();
        return Review.findReview(id);
    }
    
    public Review ReviewDataOnDemand.getRandomReview() {
        init();
        Review obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Review.findReview(id);
    }
    
    public boolean ReviewDataOnDemand.modifyReview(Review obj) {
        return false;
    }
    
    public void ReviewDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Review.findReviewEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Review' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Review>();
        for (int i = 0; i < 10; i++) {
            Review obj = getNewTransientReview(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
