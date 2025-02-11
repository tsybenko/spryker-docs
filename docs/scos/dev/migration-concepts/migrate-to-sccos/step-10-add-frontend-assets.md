---
title: 'Step 10: Add frontend assets'
description: To migrate to SCCOS, one of the steps, is adding the frontend assets.
template: howto-guide-template
last_updated: Dec 6, 2023
---

After you have implemented security and performance guidelines, add the frontend assets as described in this document.

## 1. Host frontend assets in SCCOS 
The default Spryker approach for hosting frontend assets, such as images and videos, is based on a CDN that uses an S3 bucket. If you need to host frontend assets within the SCCOS environment, submit a CDN creation request through your account on the [Spryker Support portal](https://support.spryker.com/). 

## 2. Upload images to S3
Once the S3 bucket has been established, you can manually upload asset files to the S3 bucket using the AWS user interface.

## 3. Update URLs in the database
To ensure the seamless transition to the new image URLs, execute an SQL update query within the Spryker cloud database. The query should update the old image URLs with the new ones. The list of tables that store images includes:
* spy_product_image
* spy_category_image
* Any other tables related to images 

## 4. Publish new URLs to Redis and Elasticsearch
Trigger the publish events for images. This process ensures that the image URLs are republished not only in Redis and Elasticsearch but also in the `_search` and `_storage` tables. 
To trigger the publish events, run the following command:

```bash
console publisher:trigger-events -r product_abstract_image,product_concrete_image,configurable_bundle_template_image,category_image
```

## Next step

[Wire custom services](/docs/scos/dev/migration-concepts/migrate-to-sccos/step-11-wire-custom-services.html)
